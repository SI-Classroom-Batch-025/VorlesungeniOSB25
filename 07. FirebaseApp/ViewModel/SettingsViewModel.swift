//
//  SettingsViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 16.05.25.
//

import SwiftUI

@MainActor
class SettingsViewModel: ObservableObject {
    
    private let fireService = FirebaseService.instance
    
    func logout() {
        try? fireService.auth.signOut()
    }
}
