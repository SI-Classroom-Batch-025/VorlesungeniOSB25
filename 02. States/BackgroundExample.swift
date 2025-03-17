//
//  BackgroundExample.swift
//  02. States
//
//  Created by Felix B on 17.03.25.
//

import SwiftUI

struct BackgroundExample: View {
    
    @Binding var background: Color
    
    private let colors: [Color] = [.blue, .red, .yellow, .green]
    
    var body: some View {
        Button("Hintergrund Ändern") {
            background = colors.randomElement()!
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    BackgroundExample(background: .constant(.red))
}
