//
//  ListImageExample.swift
//  03. Navigation
//
//  Created by Felix B on 24.03.25.
//

import SwiftUI

struct ListElement {
    var image: String
    var isFav: Bool = false
}

struct ListImageExample: View {

    @State var toggleFav = false

    @State var images = [
        ListElement(image: "pika"),
        ListElement(image: "placeholder"),
        ListElement(image: "cloud"),
        ListElement(image: "game"),
        ListElement(image: "sloth"),
        ListElement(image: "toast"),
    ]

    var body: some View {
        Toggle("Show Favorites", isOn: $toggleFav)

        List($images, id: \.image) { $element in
            if (toggleFav && element.isFav) || !toggleFav {
                ListItemView(listElement: $element)
                    .swipeActions {
                        Button("Delete", role: .destructive) {
                            images.removeAll { elementToRemove in
                                elementToRemove.image == element.image
                            }
                        }
                    }
            }
        }
    }
}

struct ListItemView: View {

    @Binding var listElement: ListElement

    var body: some View {
        HStack {
            Image(listElement.image)
                .resizable()
                .scaledToFit()
            Spacer()
            VStack {
                Image(systemName: listElement.isFav ? "heart.fill" : "heart")
                    .onTapGesture {
                        listElement.isFav.toggle()
                    }
                Text(listElement.image)
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    ListImageExample()
}
