//
//  Hund.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 01.04.25.
//

import SwiftUI
import SwiftData

@Model
class Hund {
    var name: String
    var farbe: String
    var breed: String
    
    init(name: String, farbe: String, breed: String) {
        self.name = name
        self.farbe = farbe
        self.breed = breed
    }
}
