//
//  FitnessMitgliederView.swift
//  04. Swiftdata
//
//  Created by Felix B on 03.04.25.
//

import SwiftUI
import SwiftData

struct ChatMessageView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var chats: [Chat]
    @Query private var messages: [Message]
    
    var body: some View {
        List(chats) { chat in
            VStack {
                Text(chat.name)
                Text(chat.messages.description)
            }
            .swipeActions {
                Button("Remove") {
                    context.delete(chat)
                }
            }
        }
        List(messages) { message in
            VStack {
                Text(message.text)
                Text(message.chat?.name ?? "KEIN CHAT")
            }
            .onTapGesture {
                message.chat = chats[0]
            }
            .swipeActions {
                Button("Remove") {
                    context.delete(message)
                }
            }
        }
        Button("Add Chat") {
            context.insert(Chat(name: "Chat"))
        }
        
        Button("Add Message") {
            var message = Message(text: "Message")
            context.insert(message)
            message.chat = chats[0]
        }
    }
}

#Preview {
    ChatMessageView()
        .modelContainer(for: [Chat.self, Message.self], inMemory: true)
}
