//
//  FoodEntryView.swift
//  iFruit
//
//  Created by Zahra Karimi on 18/12/24.
//

import SwiftUI
struct FoodEntryView: View {
    struct Food {
            var imageName: String
            var title: String
        }
    var food: Food
    var body: some View {
        HStack {
            Image(food.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 3) {
                Text(food.title)
                    .font(.headline)
                    .fontWeight(.bold)
               
            }
            Spacer()
            Image(systemName: "camera.viewfinder")
                .font(.title2)
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

