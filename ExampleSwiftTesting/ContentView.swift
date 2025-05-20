//
//  ContentView.swift
//  ExampleSwiftTesting
//
//  Created by Felix B on 19.05.25.
//

import SwiftUI

struct ContentView: View {
    
    private let notifications = NotificationService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Notifications!") {
                notifications.requestPermission()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
