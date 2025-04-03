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
    var amount: Int
    var color: String
    
    init(id: UUID = UUID(), name: String, price: Double, amount: Int, color: String) {
        self.id = id
        self.name = name
        self.price = price
        self.amount = amount
        self.color = color
    }
}
