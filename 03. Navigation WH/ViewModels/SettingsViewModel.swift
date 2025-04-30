//
//  SettingsViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

@MainActor
class SettingsViewModel: ObservableObject {
    @Published var backgroundColors: [Color] = [.yellow, .orange, .red]

    

}
