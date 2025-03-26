//
//  TabViewExample.swift
//  03. Navigation
//
//  Created by Felix B on 26.03.25.
//

import SwiftUI

struct TabViewExample: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .black
        UITabBar.appearance().unselectedItemTintColor = .white
    }
    
    var body: some View {
        TabView {
            Tab("News", systemImage: "envelope") {
                SheetExample()
            }
            
            Tab("Settings", systemImage: "wrench") {
                AlertExampleView()
            }
        }
        .tint(.yellow)
        // Tint färbt die "selection" aber auch die subviews komplett, was dazu führt das einige buttons eingefärbt werden könnten, zur not sonst einmal einen weiteren Tint auf die subviews anwenden.
    }
}

#Preview {
    TabViewExample()
}
