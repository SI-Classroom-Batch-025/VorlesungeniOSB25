//
//  ChatView.swift
//  03. Navigation
//
//  Created by Felix B on 24.03.25.
//

import SwiftUI

struct ChatListView: View {
    
    @State var chats: [Chat] = [
        Chat(name: "Boss", image: "cloud", messages: [
            Message(fromSelf: false, content: "Mir fehlt noch das und das"),
            Message(fromSelf: false, content: "Was geht!"),
            Message(content: "Hallo!"),
        ]),
        Chat(name: "Kollege", image: "sloth", messages: [
            Message(fromSelf: false, content: "Lass mal nachher Bowlen gehen"),
            Message(fromSelf: false, content: "Was geht!"),
            Message(content: "Hallo!"),
        ])
    ]
    
    @Binding var colors: [Color]
    
    var body: some View {
        NavigationStack {
            List($chats) { $chat in
                NavigationLink {
                    ChatView(chat: $chat)
                } label: {
                    ChatListItem(chat: chat)
                        .colorMultiply(Color.clear)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .overlay {
                    ChatListItem(chat: chat)
                }
            }
            .listStyle(.plain)
            .background(AnimatedBackground(colors: $colors))
        }
        //.scrollContentBackground(.hidden)
        // Wenn listtyle nicht .plain ist, kann man mit diesem Modifier den Hintergrund der Liste ausblenden und seinen eigenen anzeigen
        
    }
}

#Preview {
    ChatListView(colors: .constant([.yellow, .orange, .red]))
}
