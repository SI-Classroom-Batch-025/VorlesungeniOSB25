//
//  ProductListHeaderView.swift
//  04. Swiftdata
//
//  Created by Felix B on 02.04.25.
//

import SwiftUI

struct ProductListHeaderView: View {
    
    @Binding var maxPrice: Double
    
    @Environment(\.modelContext) private var context

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
                    let product = Product(name: name, price: price, amount: 10, color: "Rot")
                    self.name = ""
                    self.price = ""
                    context.insert(product)
                }
            }
            
            Slider(value: $maxPrice, in: 0...10000, step: 10)
            Text("Der maximale zu zeigende Preis: \(String(format: "%.0f", maxPrice))")
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
    ProductListHeaderView(maxPrice: .constant(1000))
        .modelContainer(for: Product.self)
}
