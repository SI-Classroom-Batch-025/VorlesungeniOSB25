//
//  ProductListView.swift
//  06. MVVM
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

struct ProductListView: View {
    
    // Beispielhaft, das es viele ViewModels innerhalb einer View geben kann
    @StateObject private var productViewModel = ProductViewModel(productRepository: RemoteProductRepository())
    @ObservedObject var cartViewModel: CartViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            List(productViewModel.products) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    HStack {
                        Text(product.title)
                        Spacer()
                        Text(product.price.description)
                    }
                }
                .swipeActions {
                    Button("Add to Cart") {
                        cartViewModel.addToCart(product)
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Remove", role: .destructive) {
                        productViewModel.deleteProduct(product)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(settingsViewModel.color)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        productViewModel.showAddSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $productViewModel.showAddSheet) {
                TextField("Produktname", text: $productViewModel.productName)
                TextField("Produktname", text: $productViewModel.productPrice)
                Button("Produkt hinzufügen") {
//                    productViewModel.addProduct()
                }
            }
        }
        
    }
}

#Preview {
    ProductListView(cartViewModel: CartViewModel())
        .environmentObject(SettingsViewModel())
}
