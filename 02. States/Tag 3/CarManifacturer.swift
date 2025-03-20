//
//  CarManifacturer.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 19.03.25.
//

import Foundation

enum CarManifacturer: String, CaseIterable, Identifiable {
    case bmw = "BMW"
    case mercedes = "Mercedes"
    case audi = "Audi"
    case ford = "Ford"
    case manta = "Manta"
    case porsche = "Porsche"
    case ferrari = "Ferrari"
    
    var id: CarManifacturer {
        self
    }
}
