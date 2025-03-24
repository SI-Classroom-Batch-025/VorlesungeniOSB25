//
//  ListItemView.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 24.03.25.
//

import SwiftUI

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
                Text(listElement.description)
            }
        }
        .frame(height: 100)
    }
}

#Preview {
    ListItemView(listElement: .constant(ListElement(image: "pika", description: "Oh no!")))
}
