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
    @Published var name: String = ""
    @Published var city: String = ""
    @Published var errorText: String = ""
    @Published var loggedInUser: User?
    
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func login() {
        guard !username.isEmpty || !password.isEmpty else {
            errorText = "Username und Passwort muss ausgefüllt sein."
            return
        }
        Task {
            loggedInUser = await userRepository.login(username: username, password: password)
        }
    }
    
    func register() {
        guard !username.isEmpty || !password.isEmpty else {
            errorText = "Username und Passwort muss ausgefüllt sein."
            return
        }
        Task {
            loggedInUser = await userRepository.register(username: username, password: password, name: name, city: city)
        }
    }
    
    func logout() {
        loggedInUser = nil
    }
}
