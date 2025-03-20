//
//  CounterView.swift
//  02. States
//
//  Created by Felix B on 17.03.25.
//

import SwiftUI

struct CounterView: View {
    
    // Binding ist eine "Verbindung" zu einer übergebenen State Variable, bindings werden nie initialisiert (sprich hier kommt kein gleichzeichen hin!)
    @Binding var counter: Int
    
    // Computed properties erneuern auch views, wenn die property von einem State oder Binding abhängig ist.
    var isEven: Bool {
        counter % 2 == 0
    }
    
    var body: some View {
        VStack {
            Text(counter.description)
            Text("Die Zahl ist gerade \(isEven)")
            
            HStack {
                Button("Add") {
                    counter += 1
                }
                
                Button("Sub") {
                    counter -= 1
                }
            }
        }
        .padding()
    }
}

#Preview {
    // Wenn wir auch funktionalität testen wollen, dann mit @Previewable @State eine eigene Var erstellen
    @Previewable @State var testCounter = 0
    
    
    CounterView(counter: $testCounter)
    // Ansonsten geht auch ein einfaches .constant
    //CounterView(counter: .constant(0))
}
