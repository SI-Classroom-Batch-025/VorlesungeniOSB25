//
//  NavigationWHApp.swift
//  03. Navigation WH
//
//  Created by Felix B on 31.03.25.
//

import SwiftUI

@main
struct NavigationWHApp: App {
    
    @StateObject private var settingsViewModel = SettingsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settingsViewModel)
        }
    }
}
