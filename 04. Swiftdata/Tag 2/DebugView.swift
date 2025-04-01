//
//  DebugView.swift
//  04. Swiftdata
//
//  Created by Felix B on 01.04.25.
//

import SwiftUI
import SwiftData

struct DebugView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var users: [AppUser]
    @Query private var products: [Product]
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.id.uuidString)
                Text(user.email)
            }
        }
        List(products) { product in
            HStack {
                Text(product.name)
                Text("Price: \(product.price)")
            }
        }
        HStack {
            Button("Add User") {
                insertUser()
            }
            .buttonStyle(.borderedProminent)
            
            Button("Add Product") {
                let product = Product(
                    name: Array(0...100).randomElement()!.description,
                    price: Double(Array(0...100).randomElement()!)
                )
                context.insert(product)
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    private func insertUser() {
        let user = AppUser(
            email: Array(0...100).randomElement()!.description,
            password: "123",
            username: "123"
        )
        context.insert(user)
        try? context.save() // try? ist kurzform von do-try-catch, ohne catch block
    }
}

#Preview {
    DebugView()
        .modelContainer(for: [AppUser.self, Product.self], inMemory: true)
}
