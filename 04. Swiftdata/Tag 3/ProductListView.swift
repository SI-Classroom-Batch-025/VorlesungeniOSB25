//
//  ProductListVIew.swift
//  04. Swiftdata
//
//  Created by Felix B on 02.04.25.
//

import SwiftUI
import SwiftData

struct ProductListView: View {
    
    @Query private var products: [Product]
//    @Query(filter: #Predicate<Product> { product in
//        product.price < 1000
//    }, sort: \Product.price) private var products: [Product]
    
//    var filteredProducts: [Product] {
//        products.filter {
//            $0.name == "asd"
//        }
//    }
    
    @Environment(\.modelContext) private var context
    @State private var name = ""
    @State private var price = ""
    @State private var selectedProduct: Product?
    
    init(maxPrice: Double) {
        // Unsere Abfragelogik, ist hier in einem init geschrieben und in einer Subview ausgelagert wurden, damit wir einen dynamischen Filter erstellen können
        let predicate = #Predicate<Product> { product in
            product.price < maxPrice
        }
        // Wir erstellen eine neue Abfrage basierend auf unserer vorher definierten Abfragelogik (predicate)
        let query = Query(filter: predicate, sort: \Product.price)
        
        _products = query // mit einem _ verändern wir die Variable in einem Wrapper, hier z.B. das array products
    }

    var body: some View {
        List(products) { product in
            HStack {
                Text(product.name)
                Spacer()
                Text(product.price.description)
            }
            .onTapGesture {
                selectedProduct = product
            }
            .swipeActions {
                Button("Delete", systemImage: "trash", role: .destructive) {
                    context.delete(product)
                    try? context.save()
                }
            }
        }
        .sheet(item: $selectedProduct) { product in
            TextField("Name", text: $name)
            TextField("Price", text: $price)
            Button("Accept") {
                // Dieser Part ist das eigentliche Aktualisieren des Produktes
                product.name = name
                // Preis wird nur aktualisiert wenn der Nutzer auch einen Double eingegeben hat
                if let price = Double(price) {
                    product.price = price
                }
                // Save kann aufgerufen werden, muss aber nicht, da auf dem richtigen Gerät bzw. dem Simulator das autosave feature diesen Part übernimmt. Für Previews kann man aber ein save machen.
                try? context.save()
                selectedProduct = nil
            }
        }
        .onChange(of: selectedProduct) { oldValue, newValue in
            // Ist nur für die initialisierung des sheets
            if let newValue {
                price = String(newValue.price)
                name = newValue.name
            }
        }
    }
}

#Preview {
    ProductListView(maxPrice: 300000)
        .modelContainer(for: Product.self)
}
