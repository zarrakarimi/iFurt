//
//  ContentView.swift
//  iFruit
//
//  Created by Zahra Karimi on 06/12/24.
//

import CoreML
import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State private var showCamera = false
    @State private var selectedImage: UIImage?
    @State var image: UIImage?
    @State var probability: [String: Double] = [:]
    @State var names: [String] = [""]
    @State var target: String = ""
    @State var scanned: Bool = false
    
    
    var body: some View {
        VStack {
            if let selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .scaledToFit()
                Button("Print prediction") {
                    let result = makePrediction(image: selectedImage)
                    print(result?.0 as Any)
                    print(result?.1 as Any)
                    print(result?.2 as Any)
                    
                    probability = result!.0
                    names = result!.1
                    target = result!.2
                    
                    scanned.toggle()
                }
            }
            else {
                Text("No Image Selected")
                    .font(.headline)
            }
            
            if scanned {
                VStack {
//                    Text("names \(names)")
//                    Text("Target: \(target)")
                    Text("Probability: \(probability)")
                }
            }
            
            Button("Open camera") {
                self.showCamera.toggle()
            }
            .fullScreenCover(isPresented: self.$showCamera) {
                accessCameraView(selectedImage: self.$selectedImage)
                    .background(.black)
            }
            
        }
        
    }
    
    func makePrediction(image: UIImage) -> ([String: Double], [String], String)? {
        do {
            let config = MLModelConfiguration()
            
//            Change the FoodScan to the name of your new model!!!!
            let model = try FoodScan(configuration: config)

            let prediction = try model.prediction(image: buffer(from: image)!)
            
            var probability = prediction.targetProbability  // [String: Double]
            let names = Array(prediction.featureNames)  // [String] - convert Set<String> to [String]
            let target = prediction.target
            
            if let maxPair = probability.max(by: { $0.value < $1.value }) {
                probability = [maxPair.key:maxPair.value]
            }
            
            return (probability, names, target)
            
        } catch {
            print("ERROR: \(error)")
            return nil
        }
    }
}

struct accessCameraView: UIViewControllerRepresentable {
    
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

// Coordinator will help to preview the selected image in the View.
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var picker: accessCameraView
    
    init(picker: accessCameraView) {
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
    
}


func buffer(from image: UIImage) -> CVPixelBuffer? {
    let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
    var pixelBuffer : CVPixelBuffer?
    let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(image.size.width), Int(image.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
    guard (status == kCVReturnSuccess) else {
        return nil
    }
    
    CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
    let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
    
    let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
    let context = CGContext(data: pixelData, width: Int(image.size.width), height: Int(image.size.height), bitsPerComponent: image.cgImage?.bitsPerComponent ?? 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
    
    context?.translateBy(x: 0, y: image.size.height)
    context?.scaleBy(x: 1.0, y: -1.0)
    
    UIGraphicsPushContext(context!)
    image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
    UIGraphicsPopContext()
    CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
    
    return pixelBuffer
}
