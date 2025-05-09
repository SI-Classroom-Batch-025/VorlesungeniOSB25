//
//  AppNavigation.swift
//  06. MVVM WH
//
//  Created by Felix B on 09.05.25.
//

import SwiftUI

struct AppNavigation: View {
    
    @StateObject private var drinkViewModel = DrinkViewModel(drinkRepository: RemoteDrinkRepository())
    
    var body: some View {
        TabView {
            Tab("Random", systemImage: "dice") {
                RandomDrinkView(drinkViewModel: drinkViewModel)
            }
            
            Tab("Suche", systemImage: "magnifyingglass") {
                DrinkListView(drinkViewModel: drinkViewModel)
            }
        }
    }
}

#Preview {
    AppNavigation()
}
