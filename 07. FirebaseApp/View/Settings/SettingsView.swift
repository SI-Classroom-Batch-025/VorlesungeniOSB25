//
//  SettingsView.swift
//  07. FirebaseApp
//
//  Created by Felix B on 16.05.25.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        ZStack {
            Color.siDeepPurple.ignoresSafeArea()
            Button("Logout") {
                settingsViewModel.logout()
            }
        } // ZStack
    }
}

#Preview {
    SettingsView()
}
