//
//  AuthView.swift
//  04. Swiftdata WH
//
//  Created by Felix B on 04.04.25.
//

import SwiftUI
import SwiftData

struct AuthView: View {
    
    @Environment(\.modelContext) private var context
    
    @State private var usernameInput = ""
    @State private var passwordInput = ""
    @State private var showRegister = false
    @State private var loggedInUser: AppUser?
    @State private var errorMessage = ""
    
    @Query private var users: [AppUser]
    
    var body: some View {
        if loggedInUser != nil {
            PostListView(loggedInUser: $loggedInUser)
        } else {
            VStack(spacing: 20) {
                TextField("Username", text: $usernameInput)
                    .textFieldStyle(.appStyle)
                SecureField("Passwort", text: $passwordInput)
                    .textFieldStyle(.appStyle)
                
                Button {
                    showRegister ? register() : login()
                } label: {
                    Text(showRegister ? "Registrieren" : "Login")
                        .font(.title)
                        .frame(width: 200, height: 40)
                }
                .buttonStyle(.appStyle)
                .padding(.top)
                
                Button(showRegister ? "Hast du schon einen Account?" : "Kein Account?") {
                    showRegister.toggle()
                }
                .tint(.yellow)
                
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.purple.mix(with: .black, by: 0.4))
        }
    }
    
    private func register() {
        //        if !usernameInput.isEmpty && !passwordInput.isEmpty {
        //            let user = AppUser(username: usernameInput, password: passwordInput)
        //        }
        errorMessage = ""
        if getUser() != nil || usernameInput.isEmpty || passwordInput.isEmpty {
            errorMessage = "Fehler beim Registrieren, Nutzername vorhanden oder ein Feld wurde leer gelassen."
            return
        }
        let user = AppUser(username: usernameInput, password: passwordInput)
        
        context.insert(user)
        loggedInUser = user
        resetView()
    }
    
    private func login() {
        errorMessage = ""
        guard let user = getUser(), user.password == passwordInput else {
            errorMessage = "Fehler beim Einloggen."
            return
        }
        loggedInUser = user
        resetView()
    }
    
    private func getUser() -> AppUser? {
        return users.first { user in
            usernameInput.lowercased() == user.username.lowercased()
        }
    }
    
    private func resetView() {
        usernameInput = ""
        passwordInput = ""
        showRegister = false
    }
}


#Preview {
    AuthView()
        .modelContainer(for: AppUser.self, inMemory: true)
}
