//
//  EntityBasedNavigationExample.swift
//  03. Navigation
//
//  Created by Felix B on 27.03.25.
//

import SwiftUI

struct EntityBasedNavigationExample: View {
    
    private var entityList = [
        Product(name: "Brot", calories: 150),
        Product(name: "Käse", calories: 250),
        Product(name: "Milch", calories: 200),
        Product(name: "Ei", calories: 50),
        Product(name: "Wurst", calories: 150),
        Product(name: "Hänchen", calories: 100),
    ]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(entityList) { product in
                NavigationLink(value: product) {
                    Text(product.name)
                }
            }
            .navigationDestination(for: Product.self) { entity in
                if let index = entityList.firstIndex(of: entity) {
                    let previous = index > 0 ? entityList[index - 1] : nil
                    
                    let next = index < (entityList.count - 1) ? entityList[index + 1] : nil

                    EntityDetailView(
                        entity: entity,
                        previous: previous,
                        next: next,
                        path: $path
                    ) {
                        path.removeLast(path.count)
                    }
                }
            }
        }
    }
}

#Preview {
    EntityBasedNavigationExample()
}
