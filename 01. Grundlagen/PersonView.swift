//
//  PersonView.swift
//  01. Grundlagen
//
//  Created by Justus Finke on 11.03.25.
//

import SwiftUI

struct PersonView: View {
    
    let person: Person
    
    var body: some View {
        VStack{
            Text("Name der Person: \(person.name)")
                .bold()
            Text("Alter der Person: \(person.age)")
                .italic()
            Text("Größe der Person: \(person.height) m")
                .font(.title3)
        }
    }
}


 #Preview {
 PersonView(person: Person(age: 35, name: "Max", height: 1.8))
 }
