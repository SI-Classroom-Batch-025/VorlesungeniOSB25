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
    var members: [AppUser]
    var messages: [Message]
}
