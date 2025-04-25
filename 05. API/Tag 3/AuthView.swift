//
//  AuthView.swift
//  05. API
//
//  Created by Felix B on 25.04.25.
//

import SwiftUI

struct AuthView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                self.errorMessage = ""
                do {
                    try validateLogin()
                    try login()
                } catch let error as LoginError {
                    self.errorMessage = "\(error.errorDescription ?? "") \n\(error.recoverySuggestion ?? "")"
                } catch {
                    self.errorMessage = error.localizedDescription
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text(errorMessage)
                .foregroundStyle(.red)
        }
        .padding()
    }
    
    func validateLogin() throws {
        if username.isEmpty {
            throw AuthError(fieldName: "Username")
        }
        if password.isEmpty {
            throw AuthError(fieldName: "Password")
        }
    }
    
    func login() throws {
        if username == "Admin" && password == "1234" {
            // Login
        } else {
            throw LoginError()
        }
    }

}

#Preview {
    AuthView()
}
