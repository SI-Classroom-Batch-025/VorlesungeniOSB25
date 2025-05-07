//
//  SettingsView.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        ZStack {
            settingsViewModel.color.ignoresSafeArea()
            VStack {
                Button("Farbe Ändern") {
                    settingsViewModel.changeColor()
                }
                Button("Logout") {
                    authViewModel.logout()
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(AuthViewModel(userRepository: LocalUserRepository()))
        .environmentObject(SettingsViewModel())
}
