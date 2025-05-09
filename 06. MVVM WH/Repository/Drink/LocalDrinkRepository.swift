//
//  LocalDrinkRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 09.05.25.
//

class LocalDrinkRepository: DrinkRepository {
    
    private var drinks: [Drink] = [
        Drink(id: "1", name: "TestDrink1", instructions: "Instructions1", category: "Category1", imageURL: "https://www.thecocktaildb.com/images/media/drink/wsyqry1479298485.jpg", alcoholic: "no"),
        Drink(id: "2", name: "TestDrink2", instructions: "Instructions2", category: "Category1", imageURL: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg", alcoholic: "no"),
        Drink(id: "3", name: "TestDrink3", instructions: "Instructions3", category: "Category2", imageURL: "https://www.thecocktaildb.com/images/media/drink/wsyqry1479298485.jpg", alcoholic: "no"),
        Drink(id: "4", name: "TestDrink4", instructions: "Instructions4", category: "Category2", imageURL: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg", alcoholic: "alcoholic"),
    ]
    
    func getDrinkByName(_ name: String) async throws -> [Drink] {
        return drinks.filter { drinkToFilter in
            drinkToFilter.name.contains(name)
        }
    }
    
    func getRandomDrink() async throws -> Drink {
        guard let drink = drinks.randomElement() else {
            throw LocalError.noRandomElement
        }
        return drink
    }
}
