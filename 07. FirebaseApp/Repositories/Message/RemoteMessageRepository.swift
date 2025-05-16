//
//  RemoteMessageRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import FirebaseFirestore

class RemoteMessageRepository: MessageRepository {
    
    private let collectionRef = FirebaseService.instance.databse.collection("chat")
    
    func createMessage(chatID: String, message: Message) throws { // Create (Add / Set)
        try collectionRef.document(chatID).collection("messages").addDocument(from: message)
    }
    
    func addMessageSnapshotListener(chatID: String, onChange: @escaping ([Message]) -> Void) -> ListenerRegistration? {
        collectionRef.document(chatID)
            .collection("messages")
            .addSnapshotListener { querySnapshot, error in // Wollen live updates unserer Messages haben für einen chat
                if let error {
                    print(error)
                    return
                }
                
                guard let documents = querySnapshot?.documents else { return }
                
                let messages = documents.compactMap { snapshot in // Wandeln alle documente die wir finden in messages um.
                    try? snapshot.data(as: Message.self)
                }
                
                onChange(messages) // Bringen die messages nach außen, da wir im repo keinen datenhalter (Variable) haben.
            }
    }
    
    
}
