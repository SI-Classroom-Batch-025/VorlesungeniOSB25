//
//  AppUser.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 01.04.25.
//

import Foundation
import SwiftData

@Model
class AppUser: Identifiable {
    var id: UUID
    var email: String
    var password: String
    var username: String
    
    init(id: UUID = UUID(), email: String, password: String, username: String) {
        self.id = id
        self.email = email
        self.password = password
        self.username = username
    }
}
