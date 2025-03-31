//
//  SettingsExampleView.swift
//  04. Swiftdata
//
//  Created by Felix B on 31.03.25.
//

import SwiftUI

struct SettingsExampleView: View {
    
    @AppStorage("email") private var email: String = ""
    
    var body: some View {
        Text(email)
    }
}

#Preview {
    SettingsExampleView()
}
