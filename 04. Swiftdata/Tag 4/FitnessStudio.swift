//
//  Untitled.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 03.04.25.
//

import SwiftData

@Model
class FitnessStudio {
    var name: String
    
    @Relationship(inverse: \Mitglied.studios)
    var mitglieder: [Mitglied]
    
    init(name: String, mitglieder: [Mitglied] = []) {
        self.name = name
        self.mitglieder = mitglieder
    }
}
