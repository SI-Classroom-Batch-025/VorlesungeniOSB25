//
//  AuthViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 28.04.25.
//

import SwiftUI

// MainActor kann man immer an das ViewModel drüber schreiben
@MainActor
// Jedes ViewModel muss ObservableObject implementieren
class AuthViewModel: ObservableObject {
    // didSet wird hier benutzt um den Fehler bei neueingabe zu verstecken.
    @Published var username: String = "" {
        didSet {
            errorText = ""
        }
    }
    // Published property wrapper ist dafür da das wir Eigenschaften "Freigeben" für die View, damit diese beobachtet werden können und die View sich damit automatisch bei Änderung aktualisiert.
    @Published var password: String = ""
    @Published var errorText: String = ""
    @Published var loggedInUser: User?
    
    private var users: [User] = []
    
    func login() {
        guard let existingUser = users.first(where: { user in
            user.username.lowercased() == username.lowercased() && user.password == password
        }) else {
            errorText = "Fehler beim einloggen, User konnte nicht gefunden werden oder Passwort ist falsch."
            return
        }
        loggedInUser = existingUser
    }
    
    func register() {
        guard !username.isEmpty && !password.isEmpty else {
            errorText = "Fehler beim registrieren, Nutzername oder Passwort ist leer."
            return
        }
        let user = User(username: username, password: password)
        users.append(user)
    }
}
