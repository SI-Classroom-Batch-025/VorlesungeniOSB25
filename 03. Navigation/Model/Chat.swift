//
//  Chat.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 18.03.25.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID = UUID()
    var name: String
    var image: String
    var messages: [Message]
    
    var newestMessage: Message? {
        messages.isEmpty ? nil : messages[0]
    }
}
