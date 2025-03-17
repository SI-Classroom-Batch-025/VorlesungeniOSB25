//
//  ContentView.swift
//  02. States
//
//  Created by Felix B on 17.03.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var counter = 0
    @State private var background: Color = .white
    
    var body: some View {
        VStack {
            CounterView(counter: $counter)
            
            MultiplyView(counter: $counter)
            
            BackgroundExample(background: $background)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(background)
    }
}

#Preview {
    ContentView()
}
