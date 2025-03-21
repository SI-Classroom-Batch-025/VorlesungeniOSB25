//
//  Event.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 21.03.25.
//

import Foundation

struct Event: Identifiable {
    var id = UUID()
    var name: String
    var date: Date
    var location: String
    var description: String
    var type: EventType
}

enum EventType: String, CaseIterable, Identifiable {
    case party = "Party"
    case concert = "Konzert"
    case convention = "Messe"
    
    var id: EventType {
        self
    }
}
