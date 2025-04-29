//
//  AppNavigation.swift
//  06. MVVM
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

struct AppNavigation: View {
    
    @StateObject private var cartViewModel = CartViewModel()
    
    var body: some View {
        TabView {
            Tab("Produkte", systemImage: "globe") {
                ProductListView(cartViewModel: cartViewModel)
            }
            Tab("Warenkorb", systemImage: "cart") {
                CartView(cartViewModel: cartViewModel)
            }
            Tab("Settings", systemImage: "wrench") {
                SettingsView()
            }
        }
    }
}

#Preview {
    AppNavigation()
        .environmentObject(SettingsViewModel())
}
