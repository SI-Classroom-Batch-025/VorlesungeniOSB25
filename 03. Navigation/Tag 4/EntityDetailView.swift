//
//  EntityDetailView.swift
//  03. Navigation
//
//  Created by Felix B on 27.03.25.
//

import SwiftUI

struct EntityDetailView: View {
    
    var entity: Product
    var previous: Product?
    var next: Product?
    
    var body: some View {
        Text(entity.name)
        Text(entity.calories.description)
//        NavigationLink(value: nextEntity) {
//            Text("Random Element")
//        }
        HStack {
            if let previous {
                NavigationLink(value: previous) {
                    Text(previous.name)
                }
            }
            Spacer()
            if let next {
                NavigationLink(value: next) {
                    Text(next.name)
                }
            }
        }
        .padding()
        
    }
}

#Preview {
    EntityDetailView(
        entity: Product(name: "TEST1", calories: 100),
        previous: Product(name: "TEST2", calories: 200),
        next: Product(name: "TEST3", calories: 300)
    )
}
