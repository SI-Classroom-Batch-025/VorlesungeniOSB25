//
//  AppUser.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 14.05.25.
//

import FirebaseFirestore

struct AppUser: Codable, Identifiable {
    @DocumentID
    var id: String?
    var username: String
    var pokedollar: Int = 0
    var chatIDs: [String] = []
}
