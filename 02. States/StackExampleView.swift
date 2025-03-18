//
//  StackExampleView.swift
//  02. States
//
//  Created by Felix B on 18.03.25.
//

import SwiftUI

struct Entry: Identifiable {
    var name: String
    var image: String

    var id = UUID()
}

struct StackExampleView: View {

    @State var entries: [Entry] = []
    @State var input = ""
    @State var image = ""

    var body: some View {

        HStack {
            TextField("Eingabe", text: $input)
            Button("Add") {
                let entry = Entry(name: input, image: image)
                entries.append(entry)
            }
        }

        HStack {
            Image(systemName: "globe")
                .onTapGesture {
                    image = "globe"
                }
                .foregroundStyle(image == "globe" ? .red : .black)

            Image(systemName: "wrench")
                .onTapGesture {
                    image = "wrench"
                }
                .foregroundStyle(image == "wrench" ? .red : .black)
            
            Image(systemName: "bubble")
                .onTapGesture {
                    image = "bubble"
                }
                .foregroundStyle(image == "bubble" ? .red : .black)
        }  // HStack

        ForEach(entries) { entry in
            HStack {
                Text(entry.name)
                Image(systemName: entry.image)
            }
        }
    }
}

#Preview {
    StackExampleView()
}
