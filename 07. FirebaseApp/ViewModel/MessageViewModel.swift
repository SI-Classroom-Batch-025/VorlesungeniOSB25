//
//  MessageViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import SwiftUI
import FirebaseFirestore

@MainActor
class MessageViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var messageInput = ""
    @Published var username = ""
    @Published var showAddUserSheet = false
    
    var userID: String? { fireService.userID }
    
    private let messageRepo = RemoteMessageRepository()
    private let chatRepo = RemoteChatRepository()
    private let userRepo = RemoteUserRepository()
    private let fireService = FirebaseService.instance
    private let chatID: String
    
    private var listener: ListenerRegistration?
    
    init(chatID: String) {
        self.chatID = chatID
        addSnapshotListener()
    }
    
    deinit {
        listener?.remove()
    }
    
    func createMessage() {
        guard let userID = fireService.userID else { return }
        let message = Message(senderID: userID, content: messageInput, timestamp: Date())
        do {
            try messageRepo.createMessage(chatID: chatID, message: message)
            messageInput = ""
        } catch {
            print(error)
        }
    }
    
    func addUserToChat() {
        Task {
            do {
                guard let userID = try await userRepo.getUserByUsername(username).id else { return }
                chatRepo.addUserToChat(chatID: chatID, userID: userID)
            } catch {
                print(error)
            }
        }
    }
    
    func addSnapshotListener() {
        self.listener = messageRepo.addMessageSnapshotListener(chatID: chatID) { [weak self] messages in
            self?.messages = messages.sorted { message1, message2 in
                message1.timestamp > message2.timestamp
            }
        }
    }
}
