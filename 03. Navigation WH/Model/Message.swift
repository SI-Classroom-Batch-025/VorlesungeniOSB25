//
//  Message.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 18.03.25.
//

import Foundation

struct Message: Identifiable {
    var id: UUID = UUID()
    var fromSelf: Bool = true
    var content: String
    var timestamp: Date = .now
}
