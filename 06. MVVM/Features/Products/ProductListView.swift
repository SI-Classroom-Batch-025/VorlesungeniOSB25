//
//  ProductListView.swift
//  06. MVVM
//
//  Created by Felix B on 29.04.25.
//

import SwiftUI

struct ProductListView: View {
    
    // Beispielhaft, das es viele ViewModels innerhalb einer View geben kann
    @StateObject private var productViewModel = ProductViewModel()
    @ObservedObject var cartViewModel: CartViewModel
    @EnvironmentObject var settingsViewModel: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            List(productViewModel.products) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text(product.price.description)
                    }
                }
                .swipeActions {
                    Button("Add to Cart") {
                        cartViewModel.addToCart(product)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(settingsViewModel.color)
        }
        
    }
}

#Preview {
    ProductListView(cartViewModel: CartViewModel())
        .environmentObject(SettingsViewModel())
}
