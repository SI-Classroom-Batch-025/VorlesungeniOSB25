//
//  Drink.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 09.05.25.
//

struct Drink: Codable, Identifiable {
    var id: String
    var name: String
    var instructions: String
    var category: String
    var imageURL: String
    var alcoholic: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case instructions = "strInstructionsDE"
        case category = "strCategory"
        case imageURL = "strDrinkThumb"
        case alcoholic = "strAlcoholic"
    }
}

struct DrinkResponse: Codable {
    var drinks: [Drink]
}
