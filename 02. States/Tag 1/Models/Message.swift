//
//  Message.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 18.03.25.
//

import Foundation

struct Message: Identifiable {
    var id: UUID = UUID()
    var from: String
    var content: String
    var image: String?
    var timestamp: Date
}
