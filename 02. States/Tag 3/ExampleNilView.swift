//
//  ExampleNilView.swift
//  02. States
//
//  Created by Felix B on 19.03.25.
//

import SwiftUI

struct ExampleNilView: View {
    
    @State private var currentManifacturer: CarManifacturer?
    
    var body: some View {
        Picker("Auswählen", selection: $currentManifacturer) {
            Text("Keine Auswahl").tag(nil as CarManifacturer?)
            ForEach(CarManifacturer.allCases) { manifacturer in
                Text(manifacturer.rawValue).tag(manifacturer)
            }
        }
        
        Button("Weiter") {
            print(currentManifacturer?.rawValue ?? "Keine Auswahl")
        }
        .buttonStyle(.borderedProminent)
    }
}

#Preview {
    ExampleNilView()
}
