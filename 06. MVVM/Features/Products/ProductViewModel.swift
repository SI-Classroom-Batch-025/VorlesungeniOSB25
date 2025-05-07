//
//  ProductViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

@MainActor
class ProductViewModel: ObservableObject {
    
    @Published var productName = ""
    @Published var productPrice = "0.0"
    @Published var showAddSheet = false
    
    @Published var products: [Product] = []
    
    private var productRepository: ProductRepository
    
    init(productRepository: ProductRepository) {
        self.productRepository = productRepository
        getProducts()
    }
    
    func getProducts() {
        Task {
            do {
                self.products = try await productRepository.getProducts()
            } catch {
                
            }
        }
    }
        
    func deleteProduct(_ product: Product) {
        productRepository.deleteProduct(product)
        getProducts()
    }
//
//    func addProduct() {
//        guard let price = Double(productPrice), !productName.isEmpty else {
//            return
//        }
//        productRepository.addProduct(Product(name: productName, price: price))
//        showAddSheet = false
//        getProducts()
//    }
}
