//
//  MVVMApp.swift
//  06. MVVM
//
//  Created by Felix B on 28.04.25.
//

import SwiftUI

@main
struct MVVMApp: App {
    
    @StateObject private var settingsViewModel = SettingsViewModel()
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .environmentObject(settingsViewModel)
        }
    }
}
