//
//  RemoteMessageRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

class RemoteMessageRepository: MessageRepository {
    
    private let collectionRef = FirebaseService.instance.databse.collection("chat")
    
    func createMessage(chatID: String, message: Message) throws { // Create (Add / Set)
        try collectionRef.document(chatID).collection("messages").addDocument(from: message)
    }
    
    func addMessageSnapshotListener(chatID: String, onChange: @escaping ([Message]) -> Void) {
        collectionRef.document(chatID)
            .collection("messages")
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print(error)
                    return
                }
                
                guard let documents = querySnapshot?.documents else { return }
                
                let messages = documents.compactMap { snapshot in
                    try? snapshot.data(as: Message.self)
                }
                
                onChange(messages)
            }
    }
    
    
}
