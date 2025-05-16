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
    
    var isLoggedIn: Bool { user != nil }
    
    private let auth = FirebaseService.instance.auth
    private let userRepo = RemoteUserRepository()
    private var authListener: NSObjectProtocol?
    
    init() {
        checkLogin()
        addAuthListener()
    }
    
    func checkLogin() {
        if let user = auth.currentUser {
            self.user = user
        }
    }
    
    func signInEmailPassword() {
        auth.signIn(withEmail: email, password: password)
    }
    
    func registerWithEmailPassword() {
        Task {
            do {
                let result = try await auth.createUser(withEmail: email, password: password)
                let appUser = AppUser(id: result.user.uid, username: email)
                try userRepo.createUser(appUser)
            } catch {
                print(error)
            }
        }
    }
    
    func signInAnon() {
        Task {
            do {
                let result = try await auth.signInAnonymously()
                let appUser = AppUser(id: result.user.uid, username: "")
                try userRepo.createUser(appUser)
            } catch {
                print(error)
            }
        }
    }
    
    func addAuthListener() {
        self.authListener = auth.addStateDidChangeListener { [weak self] auth, user in
            self?.user = user
        }
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
