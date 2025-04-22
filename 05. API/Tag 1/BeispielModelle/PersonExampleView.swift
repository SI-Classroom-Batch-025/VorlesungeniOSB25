//
//  PersonExample.swift
//  05. API
//
//  Created by Felix B on 22.04.25.
//

import SwiftUI

struct PersonExampleView: View {
    
    let person = Person(name: "Klaus", age: 34, email: "klaus@web.de", hobbies: [], address: Address(street: "hksaldk 23a", city: "Hamburg"))
    
    var body: some View {
        Text(person.name)
            
    }
}

#Preview {
    PersonExampleView()
}
