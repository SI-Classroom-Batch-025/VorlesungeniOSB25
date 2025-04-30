//
//  ChatView.swift
//  03. Navigation
//
//  Created by Felix B on 24.03.25.
//

import SwiftUI

struct ChatListView: View {

    @StateObject private var chatViewModel = ChatViewModel()
    
    var body: some View {
        NavigationStack {
            List($chatViewModel.chats) { $chat in
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
                .swipeActions {
                    Button("Delte", role: .destructive) {
                        chatViewModel.deleteChat(chat)
                    }
                }
            }
            .listStyle(.plain)
            .background(AnimatedBackground())
        }
        //.scrollContentBackground(.hidden)
        // Wenn listtyle nicht .plain ist, kann man mit diesem Modifier den Hintergrund der Liste ausblenden und seinen eigenen anzeigen
        
    }
}

#Preview {
    ChatListView()
        .environmentObject(SettingsViewModel())
}
