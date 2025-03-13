//
//  ContentView.swift
//  01 Grundlagen
//
//  Created by Felix B on 10.03.25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("Hallo Batch 25!")
            .font(.title)
            .foregroundStyle(Color.cyan)
            .bold()
            .italic()
        Button("Hallo!") {
            
        }
        .appButtonStyle()
    }
}

#Preview {
    ContentView()
}

/*
 struct Text{
 
 }
 */
