//
//  SwiftUIView.swift
//  TestingExample WH
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

struct FactView: View {
    
    @StateObject private var factsViewModel = FactsViewModel()
    
    /*
     3 Möglichkeiten ein ViewModel in die View zu holen:
     1. StateObject
        1.1 Erste Erstellung des ViewModels in den Views -> Observed und EnvironmentObject können nur dann Funktionieren, wenn es vorher irgendwo in der App auch ein passendes StateObject gibt
        1.2 Das ViewModel soll nur in dieser einen einzigen View benutzt werden
        1.3 Vergleichbar mit einem @State
        1.4 Wird direkt initialisiert (=)
     2. ObservedObject
        2.1 Vergleichbar mit einem @Binding
        2.2 Wird der View als Parameter von Außen mitgegeben
        2.3 Wird niemals direkt initialisiert (kein =), wir geben nur den Datentypen an
        2.4 Ist dafür da, wenn sich ein ViewModel über 2-3 Views erstreckt
     3. EnvironmentObject
        3.1 Wird niemals direkt initialisiert (kein =), wir geben nur den Datentypen an
        3.2 Wird der View über den modifier .environmentObject() mitgegeben
        3.3 Ist dafür da, wenn ein Viewmodel über mehrere Views hinweg benutzt wird, oder das Viewmodel zu einem späteren Zeitpunkt der View-Hirachie aufgerufen wird.
     
     */
    
    var body: some View {
        VStack {
            if let fact = factsViewModel.fact {
                Text(fact.text)
                    .font(.largeTitle)
                Text(fact.sourceURL)
                    .font(.caption)
            }
            
//            Text(factsViewModel.fact?.text ?? "Noch kein Fact")
//            Text(factsViewModel.fact?.sourceURL ?? "")
            
            
            Button("Load Fact") {
                factsViewModel.getFact()
            }
            .buttonStyle(.borderedProminent)
            
            Text(factsViewModel.errorMessage)
                .foregroundStyle(.red)
        }
        .padding()
    }
}

#Preview {
    FactView()
}
