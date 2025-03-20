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
    @State private var showPassword = false
    @State private var passwordIsValid = false
    
    var loginIsEnabled: Bool {
        !passwordIsValid || username.isEmpty
    }
    
    var body: some View {
        if isLoggedIn {
            ContentView()
        } else {
            VStack(spacing: 20) {
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                // Man kann natürlich auch seinen eigenen Textfielstyle machen, textfelder die sicherheitshalber nicht einfach so eingesehen werden sollen, sind SecureField, dazu aber in den kommenden Tagen mehr!
                VStack {
                    if showPassword {
                        TextField("Password", text: $password)
                    } else {
                        SecureField("Password", text: $password)
                    }
                }
                .textFieldStyle(.roundedBorder)
                .overlay {
                    HStack {
                        Spacer()
                        Button {
                            showPassword.toggle()
                        } label: {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                        }
                    }
                    .padding()
                    .foregroundStyle(.black)
                }
                .padding(.bottom, 30)
                .onChange(of: password) { oldValue, newValue in
                    if newValue.count >= 6 {
                        passwordIsValid = true
                    } else {
                        passwordIsValid = false
                    }
                }
                
                if !passwordIsValid {
                    Text("Das Passwort muss länger sein!")
                        .foregroundStyle(.white)
                }
                
                Button {
                    isLoggedIn = true
                } label: {
                    Text(showRegister ? "Registrieren" : "Login")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
                .foregroundStyle(.black)
                .disabled(loginIsEnabled)
                
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
