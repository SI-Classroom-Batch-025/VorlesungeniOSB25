//
//  ContentView.swift
//  02. States
//
//  Created by Felix B on 17.03.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var number = 0
    // @State private var counter = 0
    @State private var background: Color = .gray
    @State private var isNotificationOn = false
    @State private var inputText = ""
        
    var body: some View {
        VStack {
            CounterView(counter: $number)
            
            MultiplyView(counter: $number)
            
            BackgroundExample(background: $background)
            
            ContactView()
            
            Toggle(isOn: $isNotificationOn) {
                Text("Notification is \(isNotificationOn)")
            }
            
            TextField("Hier eingeben", text: $inputText)
                //.textFieldStyle(.roundedBorder)
                .frame(height: 60)
                .padding(.horizontal)
                .background()
                .clipShape(.rect(cornerRadius: 10))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(background)
    }
}

#Preview {
    ContentView()
}
