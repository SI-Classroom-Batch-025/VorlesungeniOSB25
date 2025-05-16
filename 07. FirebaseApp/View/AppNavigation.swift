//
//  AppNavigation.swift
//  07. FirebaseApp
//
//  Created by Felix B on 16.05.25.
//

import SwiftUI

struct AppNavigation: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .siPurple
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View {
        TabView {
            Tab("Chats", systemImage: "bubble") {
                ChatListView()
            }
            
            Tab("Settings", systemImage: "wrench") {
                SettingsView()
            }
        }
        .tint(.siYellow) // TabView
    }
}

#Preview {
    AppNavigation()
}
