//
//  Meal.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 22.04.25.
//

struct MealResponse: Codable {
    var meals: [Meal]
}

struct Meal: Codable, Identifiable {
    var id: String
    var name: String
    var instructions: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case instructions = "strInstructions"
        case image = "strMealThumb"
    }
}
