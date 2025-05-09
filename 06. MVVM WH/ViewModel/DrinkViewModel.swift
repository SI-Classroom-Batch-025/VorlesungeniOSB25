//
//  DrinkViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 09.05.25.
//

import SwiftUI

@MainActor
class DrinkViewModel: ObservableObject {
    @Published var drinks: [Drink] = []
    @Published var randomDrink: Drink?
    @Published var searchTerm: String = ""
    
    private let drinkRepository: DrinkRepository
    
    init(drinkRepository: DrinkRepository) {
        self.drinkRepository = drinkRepository
    }
    
    func getRandomDrink() {
        Task {
            do {
                self.randomDrink = try await drinkRepository.getRandomDrink()
            } catch {
                print(error)
            }
        }
    }
    
    func getDrinkByName() {
        Task {
            do {
                self.drinks = try await drinkRepository.getDrinkByName(searchTerm)
            } catch {
                print(error)
            }
        }
    }
}
