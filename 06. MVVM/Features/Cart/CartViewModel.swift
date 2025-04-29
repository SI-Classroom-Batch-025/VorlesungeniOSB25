//
//  CartViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

@MainActor
class CartViewModel: ObservableObject {
    @Published var cart: [Product] = []
    
    func addToCart(_ product: Product) {
        cart.append(product)
    }
}
