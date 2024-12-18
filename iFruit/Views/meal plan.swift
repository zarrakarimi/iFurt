
//
//  meal plan.swift
//  iFruit
//
//  Created by Zahra Karimi on 17/12/24.
//
//
//  Daily nutrition.swift
//  ifrut 2
//
//  Created by Zahra Karimi on 17/12/24.
//

import SwiftUI


struct mealplan: View {
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 1) {
                Text("Daily Nutrition")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .padding(.top, 2)
                
                HStack(spacing: 20) {
                    ForEach(["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"], id: \.self) { day in
                        VStack {
                            Text(day)
                                .font(.caption)
                                .foregroundColor(day == "WED" ? .black : .gray)
                            Text(day == "WED" ? "4" : "1")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: 30, height: 30)
                                .background(day == "WED" ? Color.green : Color.clear)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.top)
            
            VStack {
                ZStack {
                    Image("Pie") // Make sure "Pie" is a valid image in your assets
                        .resizable()
                        .scaledToFit()
                        .frame(width:290, height: 180)
                        .padding()
                        .background(.background)
                        .cornerRadius(20)
                        .shadow(color: .gray.opacity(0.5), radius: 10)
                        .padding(.horizontal, 30)
                }
                .frame(width: 200, height: 200)
                
                Text("Kcal remaining  1456")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }
            
            ScrollView {
                VStack(spacing: 5) {
                    let foods = [
                        FoodEntryView.Food(imageName: "omlet", title: "Breakfast"),
                        FoodEntryView.Food(imageName: "Pasta", title: "Lunch"),
                        FoodEntryView.Food(imageName: "Dinner", title: "Dinner"),
                        FoodEntryView.Food(imageName: "snack", title: "Snack"),
                        FoodEntryView.Food(imageName: "fruit", title: "Fruit")
                    ]
                    
                  
                        
                        ForEach(foods, id: \.title) { food in
                                               FoodEntryView(food: food)
                                                   .frame(height: 80) // Reduce the height of each entry
                                                   .padding(.horizontal, 10)
                        
                    }
                }
            }
            .background(Color(.systemGray6).edgesIgnoringSafeArea(.all))
        }
    }
}

struct DailyNutritionView_Previews: PreviewProvider {
    static var previews: some View {
        mealplan()
    }
}
