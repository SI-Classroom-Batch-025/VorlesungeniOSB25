//
//  AppNavigation.swift
//  TestingExample WH
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

struct AppNavigation: View {
    var body: some View {
        TabView {
            Tab("Fact", systemImage: "square.and.pencil") {
                FactView()
            }
            
            Tab("Meme", systemImage: "book.closed.fill") {
                MemeView()
            }
        }
    }
}

#Preview {
    AppNavigation()
}
