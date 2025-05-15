//
//  ChatViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import SwiftUI

@MainActor
class ChatViewModel: ObservableObject {
    @Published var chats: [Chat] = []
    @Published var newChatName = ""
    @Published var username = ""
    
    private let chatRepo = RemoteChatRepository()
    private let userRepo = RemoteUserRepository()
    private let fireService = FirebaseService.instance
    
    init() {
        getChats()
    }
    
    func getChats() {
        Task {
            do {
                guard let id = fireService.userID else { return }
                self.chats = try await chatRepo.getChats(id)
            } catch {
                print(error)
            }
        }
    }
    
    func createChat() {
        do {
            guard let userID = fireService.userID else { return }
            let chat = Chat(name: newChatName, memberIDs: [userID])
            try chatRepo.createChat(chat)
        } catch {
            print(error)
        }
    }
    
    func deleteChat(_ chat: Chat) {
        guard let id = chat.id else { return }
        chatRepo.deleteChat(chatID: id)
    }
    
    func addUserToChat(_ chat: Chat) {
        Task {
            do {
                guard let id = chat.id else { return }
                guard let userID = try await userRepo.getUserByUsername(username).id else { return }
                chatRepo.addUserToChat(chatID: id, userID: userID) // TODO: Umschreiben, damit addUserToChat username statt userID annimmt.
            } catch {
                print(error)
            }
        }
    }
    
    func removeUserFromChat() {
        
    }
}
