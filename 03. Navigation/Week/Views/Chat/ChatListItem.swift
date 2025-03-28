//
//  ChatListItem.swift
//  03. Navigation
//
//  Created by Felix B on 28.03.25.
//

import SwiftUI

struct ChatListItem: View {
    
    var chat: Chat
    
    var body: some View {
        HStack(alignment: .top) {
            Image(chat.image)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(.buttonBorder)
            VStack(alignment: .leading) {
                Text(chat.name)
                    .font(.title)
                Text(chat.newestMessage?.content ?? "")
                    .font(.footnote)
                HStack {
                    Spacer()
                    Text(chat.newestMessage?.timestamp.formatted(date: .numeric, time: .shortened) ?? "")
                        .font(.footnote)
                }
            }
            .padding(.leading, 5)
            Spacer()
        }
        .padding(10)
        //.frame(maxWidth: .infinity, alignment: .leading)
        // Frame kann auch genutzt werden, anstelle des Spacers
        .background {
            Rectangle()
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)
                .shadow(color: .gray, radius: 5)
        }
    }
}

#Preview {
    ChatListItem(chat: Chat(name: "Boss", image: "cloud", messages: [
        Message(fromSelf: false, content: "Mir fehlt noch das und das"),
        Message(fromSelf: false, content: "Was geht!"),
        Message(content: "Hallo!")
    ]))
}
