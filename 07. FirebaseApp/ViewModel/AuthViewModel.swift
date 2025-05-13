//
//  AuthViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 13.05.25.
//

import SwiftUI
import FirebaseAuth

@MainActor
class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var email: String = ""
    @Published var password: String = ""
    
    var isLoggedIn: Bool {
        user != nil
    }
    
    private let auth = Auth.auth()
    
    init() {
        checkLoggedIn()
    }
    
    func checkLoggedIn() {
        guard let user = auth.currentUser else {
            return
        }
        self.user = user
    }
    
    func registerWithEmailPassword() {
        Task {
            do {
                let result = try await auth.createUser(withEmail: email, password: password)
                self.user = result.user
            } catch {
                print(error)
            }
        }
    }
    
    func signInEmailPassword() {
        Task {
            do {
                let result = try await auth.signIn(withEmail: email, password: password)
                self.user = result.user
            } catch {
                print(error)
            }
        }
    }
    
    func signInAnon() {
        Task {
            do {
                let result = try await auth.signInAnonymously()
                self.user = result.user
            } catch {
                print(error)
            }
        }
    }
    
    func logout() {
        try? auth.signOut()
        self.user = nil
    }
}

/*
 
 
 private var auth = Auth.auth()
 @Published var user: User?

 func loginAnonymously() {
    // Callback Methode zum anonymen Einloggen
     auth.signInAnonymously() { authResult, error in
        
        // Wenn ein Fehler beim einloggen passiert, dann soll der Fehler auf der Console geprintet werden und die Funktion soll abgebrochen werden.
         if let error {
             print("Login failed:", error.localizedDescription)
             return
         }
         
        // authResult ist optional, da kein Result mitgegeben wird wenn error nicht nil ist.
         guard let authResult else { return }
         
         print("User is logged in with id '\(authResult.user.uid)'")
        // Setzen den eingeloggten user
         self.user = authResult.user
     }
 }
 
 */
