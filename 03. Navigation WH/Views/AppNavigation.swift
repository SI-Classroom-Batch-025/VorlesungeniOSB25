//
//  AppNavigation.swift
//  03. Navigation
//
//  Created by Felix B on 28.03.25.
//

import SwiftUI

struct AppNavigation: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    
    var body: some View {
        TabView {
//            ForEach(TabItem.allCases) { tabItem in
//                Tab(tabItem.rawValue, systemImage: tabItem.image) {
//                    tabItem.destination
//                }
//            }
            Tab("Chat", systemImage: "bubble") {
                ChatListView()
            }
            Tab("Settings", systemImage: "wrench") {
                SettingsView()
            }
        }
        .tint(.yellow)
    }
}

#Preview {
    AppNavigation()
        .environmentObject(SettingsViewModel())
}
