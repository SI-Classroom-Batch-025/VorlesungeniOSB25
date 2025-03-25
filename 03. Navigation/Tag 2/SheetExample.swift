//
//  SheetExample.swift
//  03. Navigation
//
//  Created by Felix B on 25.03.25.
//

import SwiftUI

struct SheetExample: View {
    
    @State var showSheet = false
    @State var textInput = ""
    
    var body: some View {
        TextField("Test", text: $textInput)
        Button("ShowSheet") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            sheetView()
            // Ändert die Größe des sheets auf die bestimmte maße, medium = halber bildschirm, large = ganzer bildschirm und height = eigene höhe. Hier kann auch nur eine Größe angegeben werden, man muss aber dennoch die Array Klammern benutzen
                .presentationDetents([.medium, .large, .height(150)])
        }
    }
    
    // MARK: - Viewbuilder
    
    // Viewbuilder werden benutzt um subviews innerhalb einer View zu erstellen, welche vielleicht zu kleine für eine eigene Datei sind, aber zu groß um sie in dem Body zu halten.
    @ViewBuilder
    func sheetView() -> some View {
        VStack {
            Text("ICH BIN EIN SHEET HOLT MICH HIER RAUS")
            TextField("Test", text: $textInput)
            Button("Bestätigen") {
                
            }
        }
    }
}

#Preview {
    SheetExample()
}
