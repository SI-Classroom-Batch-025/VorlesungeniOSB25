//
//  ChatViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

@MainActor
class ChatViewModel: ObservableObject {
    @Published var chats: [Chat] = [
        Chat(name: "Boss", image: "cloud", messages: [
            Message(fromSelf: false, content: "Mir fehlt noch das und das"),
            Message(fromSelf: false, content: "Was geht!"),
            Message(content: "Hallo!"),
        ]),
        Chat(name: "Kollege", image: "sloth", messages: [
            Message(fromSelf: false, content: "Lass mal nachher Bowlen gehen"),
            Message(fromSelf: false, content: "Was geht!"),
            Message(content: "Hallo!"),
        ])
    ]
    
    func addChat() {
        
    }
    
    func deleteChat(_ chat: Chat) {
        
    }
}
