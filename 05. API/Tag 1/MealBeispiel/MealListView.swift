//
//  MealListView.swift
//  05. API
//
//  Created by Felix B on 22.04.25.
//

import SwiftUI

struct MealListView: View {
    
    @State var meals: [Meal] = []
    @State var searchTerm = ""
    
    var body: some View {
        TextField("Searchterm", text: $searchTerm)
        Button("Search") {
            Task {
                do {
                    let result: MealResponse = try await Webservice().get(urlString: "https://www.themealdb.com/api/json/v1/1/search.php?s=\(searchTerm)")
                    self.meals = result.meals
                } catch {
                    print(error)
                }
            }
        }
        List(meals) { meal in
            Text(meal.name)
        }
    }
}

#Preview {
    MealListView()
}
