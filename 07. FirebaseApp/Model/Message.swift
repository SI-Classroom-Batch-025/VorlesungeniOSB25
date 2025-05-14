//
//  Message.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 14.05.25.
//

import FirebaseFirestore

struct Message: Codable, Identifiable {
    @DocumentID
    var id: String?
    var senderID: String
    var content: String
    var timestamp: Date
}
