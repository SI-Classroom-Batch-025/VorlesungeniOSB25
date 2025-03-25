//
//  AlertExampleView.swift
//  03. Navigation
//
//  Created by Felix B on 25.03.25.
//

import SwiftUI

struct AlertExampleView: View {
    
    @State var showAlert = false
    
    var body: some View {
        Button("Test Alert") {
            showAlert = true
        }
        .alert("WICHTIGE NACHRICHT", isPresented: $showAlert) {
            Button("Bestätigen") {
                
            }
            Button("Nein", role: .destructive) {
                
            }
        } message: {
            Text("Alert Alert Alert Alert Alert Alert Alert")
        }
    }
}

#Preview {
    AlertExampleView()
}
