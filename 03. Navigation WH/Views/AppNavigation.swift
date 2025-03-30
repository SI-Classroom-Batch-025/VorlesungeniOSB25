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
    
    @State var backgroundColors: [Color] = [.yellow, .orange, .red]
    
    var body: some View {
        TabView {
//            ForEach(TabItem.allCases) { tabItem in
//                Tab(tabItem.rawValue, systemImage: tabItem.image) {
//                    tabItem.destination
//                }
//            }
            Tab("Chat", systemImage: "bubble") {
                ChatListView(colors: $backgroundColors)
            }
            Tab("Settings", systemImage: "wrench") {
                SettingsView(colors: $backgroundColors)
            }
        }
        .tint(.yellow)
    }
}

#Preview {
    AppNavigation()
}
