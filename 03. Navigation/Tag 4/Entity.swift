//
//  Entity.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 27.03.25.
//

struct Product: Hashable, Identifiable {
    var name: String
    var calories: Int
    
    var id: String {
        name
    }
}
