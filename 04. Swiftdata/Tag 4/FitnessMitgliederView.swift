//
//  FitnessMitgliederView.swift
//  04. Swiftdata
//
//  Created by Felix B on 03.04.25.
//

import SwiftUI
import SwiftData

struct FitnessMitgliederView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var studios: [FitnessStudio]
    @Query private var mitglieder: [Mitglied]
    
    var body: some View {
        List(studios) { studio in
            VStack {
                Text(studio.name)
                Text(studio.mitglieder.map { $0.name }.joined(separator: ","))
            }
            .swipeActions {
                Button("Remove") {
                    context.delete(studio)
                }
            }
        }
        List(mitglieder) { mitglied in
            VStack {
                Text(mitglied.name)
                Text(mitglied.studios.description)
            }
            .swipeActions {
                Button("Remove") {
                    context.delete(mitglied)
                }
            }
        }
        Button("Add Studio") {
            var fitnessStudio = FitnessStudio(name: "Hallo", mitglieder: [])
            context.insert(fitnessStudio)
            fitnessStudio.mitglieder = [Mitglied(name: "Kevin")]
        }
        
        Button("Add Mitglied") {
            context.insert(Mitglied(name: "Hallo"))
        }
    }
}

#Preview {
    FitnessMitgliederView()
        .modelContainer(for: [FitnessStudio.self, Mitglied.self], inMemory: true)
}
