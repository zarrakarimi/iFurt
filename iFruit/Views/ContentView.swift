//
//  ContentView.swift
//  iFruit
//
//  Created by Zahra Karimi on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            Tab("Diary", systemImage: "calendar.day.timeline.left") {
                mealplan()
            }
            Tab("History", systemImage: "heart.fill") {
                CameraView()
            }
            Tab("Scan", systemImage: "camera.viewfinder") {
                CameraView()
            }
            Tab("Meal", systemImage: "fork.knife") {
                CameraView()
            }
            
            Tab("Profile", systemImage: "person.crop.circle") {
                CameraView()
            }
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
