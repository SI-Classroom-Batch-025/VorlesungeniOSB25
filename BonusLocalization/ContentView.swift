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
    
    // Für Torsten
    @State private var date: Date = Date()
    @State private var selectedDate: SelectedDate?
    @State private var showSheet: Bool = false
    
    private var usernameCharacterMinsize: Int {
        max(8 - username.count, 0)
    }
    
    var body: some View {
        VStack {
            
            Text(Strings.welcomeText)
                .font(.largeTitle)
            
            // Für Torsten
            HStack {
                DatePicker("Date", selection: $date)
//                    .onChange(of: date) { oldValue, newValue in
//                        showSheet = true
//                    }
                Button("Bearbeiten") {
                    selectedDate = SelectedDate(date: date)
                }
            }
            
            
            
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
        .sheet(isPresented: $showSheet) {
            Text(date.formatted())
        }
        .sheet(item: $selectedDate) { selectedDate in
            Text(selectedDate.date.formatted())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
}

#Preview {
    NavigationStack {
        ContentView()
        // Simulieren das das handy auf Spanisch ist (de = Deutsch, en = Englisch usw.)
            .environment(\.locale, Locale(identifier: "de"))
    }
}

struct SelectedDate: Identifiable {
    var id = UUID()
    var date: Date
}
