//
//  MessageListView.swift
//  07. FirebaseApp
//
//  Created by Felix B on 15.05.25.
//

import SwiftUI

struct MessageListView: View {
    
    @StateObject private var messageViewModel: MessageViewModel
    
    init(chatID: String) {
        self._messageViewModel = StateObject(wrappedValue: MessageViewModel(chatID: chatID))
    }
    
    var body: some View {
        VStack {
            List(messageViewModel.messages) { message in
                MessageItemView(message: message)
                    .listRowBackground(Color.clear)  // Um den systemcolor Hintergrund eines Elementes zu entfernen
                    .listRowSeparator(.hidden)
                    .rotationEffect(.degrees(180)) // Um die Items selber wieder richtig auszurichten
            }
            .listStyle(.plain)
            .rotationEffect(.degrees(180)) // Damit die Liste von unten nach oben geht und wir immer den neusten eintrag sofort sehen können
            HStack {
                TextField("...", text: $messageViewModel.messageInput)
                    .textFieldStyle(.roundedBorder)
                Button {
                    messageViewModel.createMessage()
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 35)
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .background(.black)
        }
        //.scrollContentBackground(.hidden) // Wenn ihr Hintergründe anzeigen lassen wollt, muss der Scrollcontent Background vesteckt werden.
        .background {
            Color.gray
        }

    }
}

#Preview {
    MessageListView(chatID: "l07ALbYEHSWyzakQzF76")
}
