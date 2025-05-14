//
//  AuthView.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 13.05.25.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        if authViewModel.isLoggedIn {
            Text(authViewModel.user?.uid ?? "KEINE UID")
            Text("\(authViewModel.user?.isAnonymous ?? false)")
            Button("Logout") {
                authViewModel.logout()
            }
            
            if let user = authViewModel.appUser {
                Text(user.username)
                Text(user.pokedollar.description)
                Text(user.chatIDs.description)
            }
        } else {
            
            VStack {
                TextField("Email", text: $authViewModel.email)
                SecureField("Password", text: $authViewModel.password)
                Button("LoginEmail") {
                    authViewModel.signInEmailPassword()
                }
                Button("RegisterEmail") {
                    authViewModel.registerWithEmailPassword()
                }
                Button("LoginAnon") {
                    authViewModel.signInAnon()
                }
            }
            .padding()
        }
    }
}

#Preview {
    AuthView()
}



