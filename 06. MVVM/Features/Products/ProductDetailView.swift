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
        Text(product.title)
        Text(product.id.description)
        Text(product.price.description)
    }
}

#Preview {
    ProductDetailView(product: Product(id: 0, title: "TEST", price: 0.0, description: "DASD", category: "TESTCAT", image: "ASDQWEQWE"))
}
