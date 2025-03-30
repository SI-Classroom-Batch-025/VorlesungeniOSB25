//
//  ContentView.swift
//  03. Navigation
//
//  Created by Felix B on 23.03.25.
//

import SwiftUI

struct Entity: Identifiable {
    var name: String
    var cal: Int
    var type: EntityType
    var id: String {
        name
    }
}

enum EntityType: String, CaseIterable, Identifiable {
    case food, drink, snacks
    
    var id: EntityType {
        self
    }
}

struct ContentView: View {
    
    var entites = [
        Entity(name: "TEST1", cal: 100, type: .food),
        Entity(name: "TEST2", cal: 200, type: .food),
        Entity(name: "TEST3", cal: 300, type: .drink),
        Entity(name: "TEST4", cal: 400, type: .drink),
        Entity(name: "TEST5", cal: 500, type: .snacks),
        Entity(name: "TEST6", cal: 600, type: .snacks),
        Entity(name: "TEST7", cal: 700, type: .food),
    ]
    
    var body: some View {
        List {
            ForEach(EntityType.allCases) { entityType in
                Section(entityType.rawValue) {
                    ForEach(entites) { entity in
                        if entity.type == entityType {
                            HStack {
                                Text(entity.name)
                                Spacer()
                                Text(entity.cal.description)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
