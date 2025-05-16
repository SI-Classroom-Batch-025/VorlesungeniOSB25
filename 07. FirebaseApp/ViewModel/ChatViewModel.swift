//
//  ChatViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import SwiftUI
import FirebaseFirestore

@MainActor
class ChatViewModel: ObservableObject {
    @Published var chats: [Chat] = []
    @Published var newChatName = ""
    @Published var showAddChatSheet = false
    
    private let chatRepo = RemoteChatRepository()
    private let fireService = FirebaseService.instance
    private var listener: ListenerRegistration?
    
    init() {
        addChatListener()
    }
    
//    func getChats() {
//        Task {
//            do {
//                guard let id = fireService.userID else { return }
//                self.chats = try await chatRepo.getChats(id)
//            } catch {
//                print(error)
//            }
//        }
//    }
    
    func createChat() {
        do {
            guard let userID = fireService.userID else { return }
            let chat = Chat(name: newChatName, memberIDs: [userID])
            try chatRepo.createChat(chat)
            showAddChatSheet = false
        } catch {
            print(error)
        }
    }
    
    func deleteChat(_ chat: Chat) {
        guard let id = chat.id else { return }
        chatRepo.deleteChat(chatID: id)
    }
    
    func addChatListener() {
        guard let userID = fireService.userID else { return }
        listener = chatRepo.addChatSnapshotListener(userID: userID) { [weak self] chats in
            self?.chats = chats
        }
    }
}
