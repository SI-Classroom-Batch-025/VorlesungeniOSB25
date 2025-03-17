//
//  ContactView.swift
//  02. States
//
//  Created by Felix B on 17.03.25.
//

import SwiftUI

struct ContactView: View {
    @State private var showContact = false
    
    var body: some View {
        Button("Kontakt") {
            showContact.toggle()
        }
        .buttonStyle(.borderedProminent)
        
        if showContact {
            Text("Felix")
            Text("30")
        }
    }
}

#Preview {
    ContactView()
}
