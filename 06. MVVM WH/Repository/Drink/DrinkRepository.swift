//
//  DrinkRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 09.05.25.
//

protocol DrinkRepository {
    func getDrinkByName(_ name: String) async throws -> [Drink]
    func getRandomDrink() async throws -> Drink
}
