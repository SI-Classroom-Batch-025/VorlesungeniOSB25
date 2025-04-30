//
//  Product.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

struct Product: Codable, Identifiable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
}
