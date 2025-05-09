//
//  RemoteDrinkRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 09.05.25.
//

import Foundation

class RemoteDrinkRepository: DrinkRepository {
    
    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1/"
    
    func getDrinkByName(_ name: String) async throws -> [Drink] {
        let response: DrinkResponse = try await WebService().getData(for: "\(baseURL)search.php?s=\(name)")
        return response.drinks
    }
    
    func getRandomDrink() async throws -> Drink {
        let response: DrinkResponse = try await WebService().getData(for: "\(baseURL)random.php")
        return response.drinks[0]
    }
}
