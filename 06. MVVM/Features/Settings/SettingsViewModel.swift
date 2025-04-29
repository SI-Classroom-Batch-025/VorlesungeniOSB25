//
//  SettingsViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

@MainActor
class SettingsViewModel: ObservableObject {
    @Published var color: Color = .white
    
    private let colors: [Color] = [
        .white,
        .red,
        .blue
    ]
    
    func changeColor() {
        self.color = colors.randomElement()!
    }
}
