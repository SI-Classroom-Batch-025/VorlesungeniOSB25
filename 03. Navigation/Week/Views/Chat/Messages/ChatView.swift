//
//  MessageListView.swift
//  03. Navigation
//
//  Created by Felix B on 24.03.25.
//

import SwiftUI

struct ChatView: View {

    @Binding var chat: Chat

    @State var messageInput = ""

    var body: some View {
        VStack {
            HStack {
                Text(chat.name)
            }
            .frame(maxWidth: .infinity)
            .background()
            List(chat.messages) { message in
                MessageItemView(message: message)
                    .listRowBackground(Color.clear)  // Um den systemcolor Hintergrund eines Elementes zu entfernen
                    .listRowSeparator(.hidden)
                    .rotationEffect(.degrees(180)) // Um die Items selber wieder richtig auszurichten
            }
            .listStyle(.plain)
            .rotationEffect(.degrees(180)) // Damit die Liste von unten nach oben geht und wir immer den neusten eintrag sofort sehen können
            HStack {
                TextField("...", text: $messageInput)
                    .textFieldStyle(.roundedBorder)
                Button {
                    chat.messages.insert(Message(content: messageInput), at: 0)
                    messageInput = ""
                } label: {
                    Image(systemName: "paperplane")
                }
                .buttonStyle(.borderedProminent)
                .tint(.black)
                .foregroundStyle(.yellow)
            }
            .padding()
            .background(.gray)
        }
        //.scrollContentBackground(.hidden) // Wenn ihr Hintergründe anzeigen lassen wollt, muss der Scrollcontent Background vesteckt werden.
        .background {
            Image(chat.image)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(Color.black.opacity(0.8))
        }
    }
}

#Preview {
    @Previewable @State var chat = Chat(
        name: "Gruppenchat1",
        image: "pika",
        messages: [
            Message(fromSelf: false, content: "Auch nicht viel"),
            Message(fromSelf: true, content: "Nicht viel bei dir?"),
            Message(fromSelf: false, content: "Was geht ab?"),
            Message(fromSelf: true, content: "Hallo"),
        ]
    )
    
    ChatView(
        chat: $chat
    )
}
