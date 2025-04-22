//
//  RandomMealView.swift
//  05. API
//
//  Created by Felix B on 22.04.25.
//

import SwiftUI

struct RandomMealView: View {
    
    @State var randomMeal: Meal? = nil
    
    var body: some View {
        if let meal = randomMeal {
            Text(meal.name)
            AsyncImage(url: URL(string: meal.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        Button("Random") {
            Task {
                do {
                    self.randomMeal = try await getRandomMeal()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func getRandomMeal() async throws -> Meal {
        let urlString = "https://www.themealdb.com/api/json/v1/1/random.php"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.urlMalformed
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
        
        return mealResponse.meals[0]
    }
}

#Preview {
    RandomMealView()
}
