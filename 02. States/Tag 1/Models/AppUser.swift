//
//  AppUser.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 18.03.25.
//

import Foundation

struct AppUser: Identifiable {
    var id: String {
        username
    }
    var username: String
    var joinedChats: [UUID]
}
