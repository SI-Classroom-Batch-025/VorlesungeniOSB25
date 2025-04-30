//
//  LocalProductRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 30.04.25.
//

class LocalProductRepository {
    
    private var products: [Product] = [
        Product(id: 0, title: "Test1", price: 1.99, description: "Test1Desc", category: "cat1", image: "image1"),
        Product(id: 1, title: "Test2", price: 2.99, description: "Test2Desc", category: "cat2", image: "image2"),
        Product(id: 2, title: "Test3", price: 3.99, description: "Test3Desc", category: "cat3", image: "image3")
    ]
    
    func getProducts() async throws -> [Product] {
        return products
    }
        
    func deleteProduct(_ product: Product) {
        
    }
    
    func addProduct(_ product: Product) {
        
    }
}
