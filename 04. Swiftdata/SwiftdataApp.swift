//
//  SwiftdataApp.swift
//  04. Swiftdata
//
//  Created by Felix B on 31.03.25.
//

import SwiftUI
import SwiftData

@main
struct SwiftdataApp: App {
    var body: some Scene {
        WindowGroup {
            ProductView()
                .modelContainer(for: [AppUser.self, Product.self])
        }
    }
}
