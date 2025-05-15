//
//  RemoteChatRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import FirebaseFirestore

class RemoteChatRepository: ChatRepository {
    
    private let collectionRef = FirebaseService.instance.databse.collection("chat")
    
    func createChat(_ chat: Chat) throws { // Create (Add / document(id) -> Set)
        try collectionRef.addDocument(from: chat)
    }
    
    func getChats(_ userID: String) async throws -> [Chat] { // Read (Alle oder ein Document -> Get)
        try await collectionRef
            .whereField("memberIDs", arrayContainsAny: [userID])
            .getDocuments() // Machen ein Abbild von der Collection zu dem Zeitpunkt
            .documents // Betrachten alle Dokumente
            .compactMap { snapshot in // CompactMap zum umwandeln in unsere Modelle
                try? snapshot.data(as: Chat.self)
            }
    }
    
    func addUserToChat(chatID: String, userID: String) { // Update (document(id) -> update)
        let data = ["memberIDs": FieldValue.arrayUnion([userID])]
        
        collectionRef.document(chatID).updateData(data)
    }
    
    func removeUserFromChat(chatID: String, userID: String) { // Update (document(id) -> update)
        let data = ["memberIDs": FieldValue.arrayRemove([userID])]
        
        collectionRef.document(chatID).updateData(data)
    }
    
    func deleteChat(chatID: String) { // Delete (document(id) -> delete)
        collectionRef.document(chatID).delete()
    }
    
    
}
