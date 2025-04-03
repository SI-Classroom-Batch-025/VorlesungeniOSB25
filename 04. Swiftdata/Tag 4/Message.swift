//
//  Message.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 03.04.25.
//

import SwiftData

@Model
class Message {
    var text: String
    var chat: Chat?
    
    init(text: String, chat: Chat? = nil) {
        self.text = text
        self.chat = chat
    }
}
