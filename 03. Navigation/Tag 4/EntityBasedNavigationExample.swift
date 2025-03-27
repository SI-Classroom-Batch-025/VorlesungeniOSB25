//
//  EntityBasedNavigationExample.swift
//  03. Navigation
//
//  Created by Felix B on 27.03.25.
//

import SwiftUI

struct EntityBasedNavigationExample: View {
    
    var entityList = [
        Product(name: "Brot", calories: 150),
        Product(name: "Käse", calories: 250),
        Product(name: "Milch", calories: 200),
        Product(name: "Ei", calories: 50),
        Product(name: "Wurst", calories: 150),
        Product(name: "Hänchen", calories: 100),
    ]
    
    var body: some View {
        NavigationStack {
            List(entityList) { product in
                NavigationLink(value: product) {
                    Text(product.name)
                }
            }
            .navigationDestination(for: Product.self) { entity in
                if let index = entityList.firstIndex(of: entity) {
                    var previous = index > 0 ? entityList[index - 1] : nil
                    var next = index < (entityList.count - 1) ? entityList[index + 1] : nil

                    EntityDetailView(
                        entity: entity,
                        previous: previous,
                        next: next
                    )
                }
            }
        }
    }
}

#Preview {
    EntityBasedNavigationExample()
}
