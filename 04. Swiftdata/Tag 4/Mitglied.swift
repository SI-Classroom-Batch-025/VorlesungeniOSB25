//
//  Mitglied.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 03.04.25.
//

import SwiftData

@Model
class Mitglied {
    var name: String
    var studios: [FitnessStudio]
    
    init(name: String, studios: [FitnessStudio] = []) {
        self.name = name
        self.studios = studios
    }
}
