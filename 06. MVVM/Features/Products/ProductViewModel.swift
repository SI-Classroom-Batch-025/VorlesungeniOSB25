//
//  ProductViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

@MainActor
class ProductViewModel: ObservableObject {
    @Published var products: [Product] = [
        Product(name: "Test1", price: 1.99),
        Product(name: "Test2", price: 2.99),
        Product(name: "Test3", price: 5.49),
        Product(name: "Test4", price: 3.29),
        Product(name: "Test5", price: 6.39),
    ]
    
}
