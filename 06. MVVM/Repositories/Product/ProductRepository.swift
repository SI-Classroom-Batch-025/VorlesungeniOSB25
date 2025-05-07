//
//  ProductRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 06.05.25.
//

protocol ProductRepository {
    func getProducts() async throws -> [Product]
        
    func deleteProduct(_ product: Product)
    
    func addProduct(_ product: Product)
}
