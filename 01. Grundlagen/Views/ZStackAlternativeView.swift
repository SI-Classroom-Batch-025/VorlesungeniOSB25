//
//  ZStackAlternative.swift
//  01. Grundlagen
//
//  Created by Felix B on 12.03.25.
//

import SwiftUI

struct ZStackAlternativeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Ich bin oben Links!")
                Spacer()
            }
            //.background(.blue)
                
            Spacer()
            HStack {
                Spacer()
                Text("Ich bin unten Rechts!")
            }
            //.background(.green)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Image("cloud"))
        .overlay {
            Text("Ich bin in der Mitte!")
        }
    }
}

#Preview {
    ZStackAlternativeView()
}
