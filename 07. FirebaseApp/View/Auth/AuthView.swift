//
//  AuthView.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 13.05.25.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    @State private var showRegister = false
    
    var body: some View {
        if authViewModel.isLoggedIn {
            AppNavigation()
        } else {
            VStack(spacing: 20) {
                LogoView()
                    .padding(.top, 30)
                
                TextField("Email", text: $authViewModel.email)
                    .textFieldStyle(.appStyle)
                
                SecureField("Password", text: $authViewModel.password)
                    .textFieldStyle(.appStyle)
                
                Button(showRegister ? "Register" : "Login") {
                    showRegister
                    ? authViewModel.registerWithEmailPassword()
                    : authViewModel.signInEmailPassword()
                }
                .font(.title)
                .buttonStyle(.appStyle)
                .padding(.top, 30) // Button
                
                HStack {
                    Button(showRegister ? "Got an account?" : "Register here") {
                        showRegister.toggle()
                    } // Button
                    
                    Spacer()
                    
                    Button("AnonLogin") {
                        authViewModel.signInAnon()
                    }
                }
                .foregroundStyle(.siYellow) // HStack
                
                Spacer()
            }
            .padding()
            .background(.siDeepPurple) // VStack
        } // if-else
    }
}

#Preview {
    AuthView()
}



