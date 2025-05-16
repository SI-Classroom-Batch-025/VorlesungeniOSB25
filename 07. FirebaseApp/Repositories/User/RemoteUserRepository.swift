//
//  RemoteUserRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 14.05.25.
//

class RemoteUserRepository: UserRepository {
    
    private let collectionRef = FirebaseService.instance.databse.collection("user")
    
    func createUser(_ user: AppUser) throws { // Create (in diesem fall wenn wir unseren Auth User mit dem Firestore user verbinden wollen immer mit setData, damit wir die Dokument ID gleich setzen können.
        // Dieser check sollte immer klappen
        guard let id = user.id else { throw FirestoreUserError.idNotFound }
        try collectionRef.document(id).setData(from: user)
    }
    
    func getUserByID(_ id: String) async throws -> AppUser {
        return try await collectionRef.document(id).getDocument(as: AppUser.self)
    }
    
    func getUserByUsername(_ username: String) async throws -> AppUser {
        guard let user = try await collectionRef
            .whereField("username", isEqualTo: username) // Filtern alle user basierend auf username
            .getDocuments()
            .documents
            .first?
            .data(as: AppUser.self) else { throw FirestoreUserError.usernameNotFound }
        return user
    }
    
    
}

enum FirestoreUserError: String, Error {
    case usernameNotFound = "Der Nutzername konnte nicht gefunden werden."
    case idNotFound = "Die ID ist nicht vorhanden!"
}
