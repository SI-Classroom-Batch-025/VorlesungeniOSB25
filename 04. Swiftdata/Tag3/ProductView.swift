//
//  ProductView.swift
//  04. Swiftdata
//
//  Created by Felix B on 02.04.25.
//

import SwiftUI

struct ProductView: View {
    
    @State private var maxPrice: Double = 10000.0
    
    var body: some View {
        ProductListHeaderView(maxPrice: $maxPrice)
        ProductListView(maxPrice: maxPrice)
    }
}

#Preview {
    ProductView()
        .modelContainer(for: Product.self)
}
