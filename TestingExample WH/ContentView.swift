//
//  ContentView.swift
//  TestingExample WH
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var factsViewModel = FactsViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onAppear {
                    factsViewModel.getFact()
                }
            if let fact = factsViewModel.fact {
                Text(fact.text)
            }
            Text(factsViewModel.errorMessage)
                .foregroundStyle(.red)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
