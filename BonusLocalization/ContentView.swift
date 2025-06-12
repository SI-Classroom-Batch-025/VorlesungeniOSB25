//
//  ContentView.swift
//  BonusLocalization
//
//  Created by Felix B on 11.06.25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    private var usernameCharacterMinsize: Int {
        max(8 - username.count, 0)
    }

    
    var body: some View {
        VStack {
            
            Text(Strings.welcomeText)
                .font(.largeTitle)
            
            // Greifen auf den Wert hinter dem Key "username_hint" in unserem String Katalog zu.
            TextField("username_hint", text: $username)
            Text(Strings().usernameCharacterCount( usernameCharacterMinsize))
                .font(.caption)
            
            SecureField("password_hint", text: $password)
            
            // Greifen in diesem Fall auf den Wert hinter dem Key, welcher in Strings als loginButton hinterlegt ist zu.
            Button(Strings.loginButton) {
                
            }
            
            Button(Strings.registerButton) {
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(\.locale, Locale(identifier: "es"))
}
