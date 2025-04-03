//
//  Chat.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 03.04.25.
//

import SwiftData

@Model
class Chat {
    var name: String
    
    @Relationship(deleteRule: .cascade, inverse: \Message.chat)
    var messages: [Message]
    
    init(name: String, messages: [Message] = []) {
        self.name = name
        self.messages = messages
    }
}
