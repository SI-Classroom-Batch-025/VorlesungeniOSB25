//
//  EnumPickerExampleView.swift
//  02. States
//
//  Created by Felix B on 19.03.25.
//

import SwiftUI

struct EnumPickerExampleView: View {
    
    @State private var currentManifacturer: CarManifacturer = .bmw
    
    var body: some View {
        Picker("Einen Hersteller auswählen", selection: $currentManifacturer) {
            ForEach(CarManifacturer.allCases) { manifacturer in
                Text("\(manifacturer.rawValue)").tag(manifacturer)
            }
        }
    }
}

#Preview {
    EnumPickerExampleView()
}
