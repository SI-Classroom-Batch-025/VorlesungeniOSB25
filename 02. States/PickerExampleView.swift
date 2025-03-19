//
//  PickerExampleView.swift
//  02. States
//
//  Created by Felix B on 19.03.25.
//

import SwiftUI

struct PickerExampleView: View {
    
    @State private var selectedFruit = "Apple"
    @State private var counter = 0
    @State private var weightInput = ""
    
    var fruits = [
        "Apple",
        "Banana",
        "Strawberry",
        "Citrus",
        "Blueberry",
        "Peach",
        "Passionfruit"
    ]
    
//    func test() {
//        $selectedFruit.wrappedValue
//    }
    
    var body: some View {
        Picker("Pick a fruit", selection: $selectedFruit) {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit).tag(fruit)
            }
        }
        // .pickerStyle(.segmented)
        
        if selectedFruit == "Apple" {
            Text("Select amount in pieces: ")
            Stepper("Select Amount \(counter)", value: $counter)
        } else {
            Text("Select amount in KG")
            TextField("Gewicht angeben", text: $weightInput)
        }
        
//        Button("Add Kiwi") {
//            fruits.append("Kiwi")
//        }
    }
}

#Preview {
    PickerExampleView()
}
