//
//  _4__Swiftdata_WHApp.swift
//  04. Swiftdata WH
//
//  Created by Felix B on 04.04.25.
//

import SwiftUI

@main
struct SwiftdataWHApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
                .modelContainer(for: AppUser.self)
        }
    }
}
