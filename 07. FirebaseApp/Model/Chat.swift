//
//  Chat.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 14.05.25.
//

import FirebaseFirestore

struct Chat: Codable, Identifiable {
    @DocumentID
    var id: String?
    var name: String
    var memberIDs: [String]
}
