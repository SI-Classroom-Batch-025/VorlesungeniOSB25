//
//  TierVIew.swift
//  04. Swiftdata
//
//  Created by Felix B on 01.04.25.
//

import SwiftUI
import SwiftData

struct TierView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var hunde: [Hund]
    
    var body: some View {
        Button("Hund hinzu") {
            context.insert(
                Hund(
                    name: "Klaus",
                    farbe: "orange",
                    breed: "corgi"
                )
            )
            
        }
        List(hunde) { hund in
            Text("\(hund.name) \(hund.breed)")
        }
    }
}

#Preview {
    TierView()
        .modelContainer(for: Hund.self, inMemory: true)
}
