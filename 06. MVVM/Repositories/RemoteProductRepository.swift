//
//  ProductRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 30.04.25.
//

import Foundation

class RemoteProductRepository {
    
    
    func getProducts() async throws -> [Product] {
        let urlString = "https://fakestoreapi.com/products"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.urlMalformed
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode([Product].self, from: data)
        
        return result
    }
        
    func deleteProduct(_ product: Product) {
        
    }
    
    func addProduct(_ product: Product) {
        
    }
}
