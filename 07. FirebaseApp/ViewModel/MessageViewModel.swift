//
//  MessageViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import SwiftUI

@MainActor
class MessageViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var messageInput = ""
    
    private let messageRepo = RemoteMessageRepository()
    private let fireService = FirebaseService.instance
    private let chatID: String
    
    init(chatID: String) {
        self.chatID = chatID
        addSnapshotListener()
    }
    
    func createMessage() {
        do {
            guard let userID = fireService.userID else { return }
            let message = Message(senderID: userID, content: messageInput, timestamp: Date())
            try messageRepo.createMessage(chatID: chatID, message: message)
            messageInput = ""
        } catch {
            print(error)
        }
    }
    
    func addSnapshotListener() {
        messageRepo.addMessageSnapshotListener(chatID: chatID) { messages in
            self.messages = messages
        }
    }
}
