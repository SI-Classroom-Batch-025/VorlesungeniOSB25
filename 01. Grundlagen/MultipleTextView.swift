//
//  MultipleTextView.swift
//  01. Grundlagen
//
//  Created by Justus Finke on 11.03.25.
//

import SwiftUI

struct MultipleTextView: View {
    
    let person: Person = Person(age: 35, name: "Max", height: 1.8)
    
    let persons = [
        Person(age: 35, name: "Max", height: 1.8),
        Person(age: 25, name: "Lisa", height: 1.7)
    ]
    var body: some View {
        VStack {
            PersonView(person: persons[0])
            Divider()
            PersonView(person: persons[1])
        }
        .padding()
        //.background(.red)
       
    }
}

#Preview {
    MultipleTextView()
}
