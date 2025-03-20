//
//  DatePickerExampleView.swift
//  02. States
//
//  Created by Felix B on 19.03.25.
//

import SwiftUI

struct User {
    var name: String
    var birthdate: Date
}

struct DatePickerExampleView: View {
    
    @State private var selectedDate: Date = Date() // .now ist das gleiche
    @State private var nameInput: String = ""
    @State private var users: [User] = []
    
    var body: some View {
        DatePicker("Select Birthdate", selection: $selectedDate, displayedComponents: [.date])
            // .datePickerStyle(.graphical)
        Text(selectedDate.formatted(date: .numeric, time: .omitted))
        Text(verbatim: "\(20000)") // Um Automatische formatierung zu umgehen
        
        TextField("Name eingeben...", text: $nameInput)
        
        Button("Add user") {
            users.append(User(name: nameInput, birthdate: selectedDate))
        }
        
        ForEach(users, id: \.name) { user in
            Text("\(user.name) ist geboren am \(user.birthdate.formatted(date: .complete, time: .omitted))")
        }
    }
}

#Preview {
    DatePickerExampleView()
}
