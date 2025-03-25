//
//  AlertExampleView.swift
//  03. Navigation
//
//  Created by Felix B on 25.03.25.
//

import SwiftUI

struct AlertExampleView: View {
    
    @State var showAlert = false
    @State var imageName = "dog.fill"
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .scaledToFit()
        
        Button("Löschen", role: .destructive) {
            showAlert = true
        }
        .alert("Soll der Hund vernichtet werden?", isPresented: $showAlert) {
            Button("Bestätigen", role: .destructive) {
                imageName = ""
            }
            Button("Nein") {
                
            }
        } message: {
            Text("Danach ist der Hund weg!")
        }
    }
}

#Preview {
    AlertExampleView()
}
