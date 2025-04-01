//
//  Product.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 01.04.25.
//

import Foundation
import SwiftData

@Model
class Product: Identifiable {
    var id: UUID
    var name: String
    var price: Double
    
    init(id: UUID = UUID(), name: String, price: Double) {
        self.id = id
        self.name = name
        self.price = price
    }
}
