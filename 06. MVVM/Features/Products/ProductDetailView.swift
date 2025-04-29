//
//  ProductDetailView.swift
//  06. MVVM
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        Text(product.name)
        Text(product.id.uuidString)
        Text(product.price.description)
    }
}

#Preview {
    ProductDetailView(product: Product(name: "TEST", price: 0.00))
}
