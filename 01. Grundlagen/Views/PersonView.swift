//
//  PersonView.swift
//  01. Grundlagen
//
//  Created by Justus Finke on 11.03.25.
//

import SwiftUI

struct PersonView: View {
    
    let person: Person
    
    let exampleClosure: () -> (Void)
    
    var body: some View {
        VStack {
            Image(person.image)
                .resizable()
                .scaledToFill()
                .frame(height: 100)
                .padding()
                .clipShape(.circle)
            
            Text("Name der Person: \(person.name)")
                .bold()
            Text("Alter der Person: \(person.age)")
                .italic()
            Text("Größe der Person: \(person.height) m")
                .font(.title3)
            
            HStack {
                Image(systemName: "manatsign.ring")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Button("Kontakt") {
                    print(person.age)
                }
                .buttonStyle(.borderedProminent)
                .tint(.yellow)
                .foregroundStyle(.black)
                .clipShape(.ellipse)
            }
            
            
            
            Button {
                print(person.name)
            } label: {
                Text("Sag meinen Namen!")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .foregroundStyle(.black)
            .tint(.green)
            .background() {
                Rectangle()
                    .clipShape(.buttonBorder)
                    .foregroundStyle(
                        LinearGradient(colors: [.white, .green, .white], startPoint: .leading, endPoint: .trailing)
                    )
            }
            
            Button(action: exampleClosure) {
                Text("Print Closure")
            }
        }
        //.background(.red)
        .padding()
        //.clipShape(.rect(cornerRadius: 22))
    }
}


 #Preview {
     PersonView(person: Person(age: 35, name: "Max", height: 1.8, image: "toast")) {
         print("Ich bin perviewPerson 1")
     }
 }
