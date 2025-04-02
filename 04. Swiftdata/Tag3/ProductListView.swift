//
//  ProductListVIew.swift
//  04. Swiftdata
//
//  Created by Felix B on 02.04.25.
//

import SwiftUI
import SwiftData

struct ProductListView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Product.price) private var products: [Product]
    @State private var name: String = ""
    @State private var price: String = ""
    
    @FocusState private var focus: Int?
    
    var body: some View {
        
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .focused($focus, equals: 0)
            
            TextField("Price", text: $price)
                .textFieldStyle(.roundedBorder)
                .focused($focus, equals: 1)

            Button("Add Product") {
                if let price = Double(price) {
                    let product = Product(name: name, price: price)
                    self.name = ""
                    self.price = ""
                    context.insert(product)
                }
            }
            
            List(products) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text(product.price.description)
                }
            }
        }
        .padding()
        .onSubmit {
            if focus == 0 {
                focus = 1
            } else {
                focus = nil
            }
        }
    }
}

#Preview {
    ProductListView()
        .modelContainer(for: Product.self)
}
