//
//  ListImageExample.swift
//  03. Navigation
//
//  Created by Felix B on 24.03.25.
//

import SwiftUI

struct ListImageExample: View {

    @State var toggleFav = false
    @State var isExpanded = false
    @State var currentSelectedElement: ListElement?
    @State var showDeletionAlert = false

    @State var images = [
        ListElement(image: "pika", description: "Oh no!"),
        ListElement(image: "placeholder", description: "...."),
        ListElement(image: "cloud", description: "Windig"),
        ListElement(image: "game", description: "Spaßig"),
        ListElement(image: "sloth", description: "Fühl ich"),
        ListElement(image: "toast", description: "Ess ich"),
    ]

    var body: some View {
        Toggle("Show Favorites", isOn: $toggleFav)

        List($images, id: \.image) { $element in
            if (toggleFav && element.isFav) || !toggleFav {
                ListItemView(listElement: $element)
                    .onLongPressGesture {
                        currentSelectedElement = element
                        isExpanded = true
                    }
                    .swipeActions {
                        Button("Delete") {
                            showDeletionAlert = true
                            currentSelectedElement = element
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button(
                            "Favorite",
                            systemImage: element.isFav ? "trash" : "heart"
                        ) {
                            element.isFav.toggle()
                        }
                    }
            }
        }
        .overlay {
            if isExpanded {
                if let currentSelectedElement {
                    Image(currentSelectedElement.image)
                        .onTapGesture {
                            isExpanded = false
                        }
                }
            }
        }
        .alert("Löschen bestätigen", isPresented: $showDeletionAlert) {
            Button("Bestätigen", role: .destructive) {
                images.removeAll { elementToRemove in
                    elementToRemove.image == currentSelectedElement?.image
                }
            }
            Button("Nein") {
                
            }
        } message: {
            Text("Möchten sie wirklich das Element löschen?")
        }
    }
    
    
}

#Preview {
    ListImageExample()
}
