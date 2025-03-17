//
//  AuthView.swift
//  02. States
//
//  Created by Felix B on 17.03.25.
//

import SwiftUI

struct AuthView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showRegister = false
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            ContentView()
        } else {
            VStack(spacing: 20) {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                TextField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom, 30)
                
                Button {
                    isLoggedIn = true
                } label: {
                    Text(showRegister ? "Registrieren" : "Login")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
                .foregroundStyle(.black)
                
                Button(showRegister ? "Möchtest du dich einloggen?" : "Noch kein Konto?") {
                    showRegister.toggle()
                }
                .tint(.yellow)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .background(.gray)
        }
    }
}

#Preview {
    AuthView()
}
