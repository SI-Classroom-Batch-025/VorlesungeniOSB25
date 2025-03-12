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
        .frame(maxWidth: .infinity) // Strecken die View auf die maximale Breite des Bildschirms
        .background(Image("cloud")) // Legt eine View unter die View, auf der der Modifiert angewendet wurde
        .overlay {
            Text("Ich bin in der Mitte!")
        } // Legt eine View über die View, auf der der Modifier angewendet wurde
    }
}

#Preview {
    ZStackAlternativeView()
}
