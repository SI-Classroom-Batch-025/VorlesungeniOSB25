//
//  SwiftUIView.swift
//  03. Navigation
//
//  Created by Felix B on 24.03.25.
//

import SwiftUI

struct ListSectionExample: View {

    @State var images = [
        ListElement(image: "pika", description: "Oh no!"),
        ListElement(image: "placeholder", description: "...."),
        ListElement(image: "cloud", description: "Windig"),
        ListElement(image: "game", description: "Spaßig"),
        ListElement(image: "sloth", description: "Fühl ich"),
        ListElement(image: "toast", description: "Ess ich"),
    ]

    var body: some View {
        List {
            Section("Favorite") {
                ForEach($images, id: \.image) { $element in
                    if element.isFav {
                        ListItemView(listElement: $element)
                    }
                }
            }
            
            Section("Non Favorite") {
                ForEach($images, id: \.image) { $element in
                    if !element.isFav {
                        ListItemView(listElement: $element)
                    }
                }
            }
        }
    }
}

#Preview {
    ListSectionExample()
}
