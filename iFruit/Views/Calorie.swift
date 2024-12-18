//
//  scan .swift
//  ifrut 2
//
//  Created by Zahra Karimi on 17/12/24.
//

import SwiftUI

struct NutritionView: View {
    var body: some View {
        VStack {
            // Header with time and battery info placeholder
           
                Text("Nutrition Values")
                    .font(.title2)
                    .fontWeight(.bold)
            
            // Content
            VStack {
                VStack(alignment: .center, spacing: 10) {
                    // Apple Image
                    HStack{
                    
                        Text("Apple")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal,110)
                        Image(systemName: "heart")
                        
                    }
                    
                    

                    Image("Apple") // Replace "apple" with your asset image name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 270, height: 240)
                        .clipShape(Circle())

                    VStack{
                        HStack(spacing: 145) {
                            Text("1 Medium Apple")
                            Text("(150)")
                        }.font(.title3)
                   
                        HStack(spacing:45){
                                Text("Nutritions values")
                                Text("Amount")
                                Text("Daily value")
                            
                        }.font(.subheadline)
                            .foregroundColor(.gray)
    
                    }
                }
                .padding()

                // Nutritional Values
                VStack(alignment: .leading, spacing: 12) {
                    NutritionRow(name: "Protein", value: "0.5g", percentage: "1%", color: .green)
                    NutritionRow(name: "Crabs", value: "25g", percentage: "8%", color: .brown)
                    NutritionRow(name: "Fat", value: "0.3g", percentage: "0%", color: .orange)
                    NutritionRow(name: "Fiber", value: "4.4g", percentage: "16%", color: .blue.opacity(0.7))
                    NutritionRow(name: "Cal", value: "11mg", percentage: "1%", color: .orange.opacity(0.7))
                    NutritionRow(name: "Vit A", value: "54IU", percentage: "1%", color: .blue)
                    NutritionRow(name: "Vit C", value: "8.4mg", percentage: "9%", color: .teal)
                    NutritionRow(name: "Iron", value: "0.2mg", percentage: "1%", color: .purple)
                    NutritionRow(name: "Vit D", value: "0IU%", percentage: "0%", color: .red)
                }
                .padding(.horizontal)
            }
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
            .padding()

            Spacer()
            
            // Footer Buttons
            HStack {
                Spacer()
                Image(systemName: "line.horizontal.3")
                Spacer()
                Image(systemName: "heart")
                Spacer()
                Image(systemName: "plus.circle")
                Spacer()
                Image(systemName: "fork.knife")
                Spacer()
                Image(systemName: "person")
                Spacer()
            }
            .padding()
            .font(.title2)
            .foregroundColor(.gray)
        }
        .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
    }
}

struct NutritionRow: View {
    var name: String
    var value: String
    var percentage: String
    var color: Color
    
    var body: some View {
        HStack {
            Text(name)
                .fontWeight(.semibold)
                .foregroundColor(color)
                .frame(width: 140, alignment: .leading)
            Text(value)
                .foregroundColor(.gray)
            Spacer()
            Text(percentage)
                .foregroundColor(.gray)
        }
        .font(.subheadline)
    }
}

struct NutritionView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionView()
    }
}
