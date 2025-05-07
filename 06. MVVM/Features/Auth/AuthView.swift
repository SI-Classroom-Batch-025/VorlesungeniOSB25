//
//  AuthView.swift
//  06. MVVM
//
//  Created by Felix B on 28.04.25.
//

import SwiftUI

struct AuthView: View {
    
    // StateObject hat immer eine initialisation also immer ein "=" Zeichen
    @StateObject private var authViewModel = AuthViewModel()
    // View spezifische Variablen, die nichts mit Logik zu tun haben, können auch in der View behalten werden. Man kann sie auch in das ViewModel mitnehmen.
    @State private var showRegister = false
    
    var body: some View {
        // Ein check ob eingeloggt oder nicht, passiert automatisch, da loggedInUser @Published ist
        if authViewModel.loggedInUser != nil {
            // AppNavigation(authViewModel: authViewModel)
            AppNavigation()
                .environmentObject(authViewModel)
        } else {
            VStack {
                TextField("Username", text: $authViewModel.username)
                SecureField("Password", text: $authViewModel.password)
                
                Button(showRegister ? "Registrieren" : "Einloggen") {
                    showRegister ? authViewModel.register() : authViewModel.login()
                }
                .buttonStyle(.borderedProminent)
                
                Button(showRegister ? "Zum Einloggen" : "Zum Registrieren") {
                    showRegister.toggle()
                }
                
                Text("TESTCOMMIT2")
                
                Text(authViewModel.errorText)
                    .foregroundStyle(.red)
            }
            .padding()
        }
    }
}

#Preview {
    AuthView()
}
