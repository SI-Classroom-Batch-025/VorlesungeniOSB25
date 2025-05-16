//
//  ButtonStyles.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 28.03.25.
//

import SwiftUI

struct AppButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .frame(maxWidth: .infinity, maxHeight: 35)
            .foregroundStyle(.black)
            .padding(10)
            .background(.yellow, in: .buttonBorder)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
    
}

extension ButtonStyle where Self == AppButtonStyle {
    static var appStyle: AppButtonStyle { AppButtonStyle() }
}


#Preview {
    Button("Hallo") {}.buttonStyle(.appStyle)
}
