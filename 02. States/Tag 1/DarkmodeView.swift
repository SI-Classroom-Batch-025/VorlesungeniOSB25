//
//  DarkmodeView.swift
//  02. States
//
//  Created by Felix B on 17.03.25.
//

import SwiftUI

struct DarkmodeView: View {
    
    @State private var isDarkMode = false
    
    var body: some View {
        VStack {
            
            Text("Lorem aosfojkahsdk asjdnalkshd kasdlka slkdalkdalsjk dlashd klajsd klajsd lkajsdlkalk haslfkh")
            
            Toggle(isOn: $isDarkMode) {
                Text("Darkmode is \(isDarkMode)")
            }
            .tint(.yellow) // Damit färben wir den "isOn" Togglebackground in eine von uns gewünschte farbe 
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(isDarkMode ? .black : .white)
        .foregroundStyle(isDarkMode ? .white : .black)

    }
}

#Preview {
    DarkmodeView()
}
