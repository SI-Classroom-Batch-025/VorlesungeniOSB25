//
//  ProductRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 30.04.25.
//

import Foundation

class RemoteProductRepository: ProductRepository {
    
    
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

/*
 let result = try JSONDecoder().decode(OuterObject.self, from: data)
 {
    "id": 1
    "text": "hallo"
    "subObject": {
        "text": "welt"
    }
 
 }
 
 let outerObject = OuterObject(id: 1, text: "hallo", subObject: SubObject(text: "welt"))
 */

//struct OuterObject: Codable {
//    var id: Int
//    var text: String
//    var subObject: SubObject
//}
//
//struct SubObject: Codable {
//    var text: String
//}
