//
//  Katze.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 01.04.25.
//

import SwiftData
import SwiftUI

@Model
class Katze {
    var name: String
    var farbe: String
    var breed: String
    
    init(name: String, farbe: String, breed: String) {
        self.name = name
        self.farbe = farbe
        self.breed = breed
    }
}
