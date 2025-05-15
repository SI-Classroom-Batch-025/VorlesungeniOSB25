//
//  ChatListView.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import SwiftUI

struct ChatListView: View {
    @StateObject private var chatViewModel = ChatViewModel()
    
    var body: some View {
        NavigationStack {
            List(chatViewModel.chats) { chat in
                NavigationLink {
                    MessageListView(chatID: chat.id!)
                } label: {
                    Text(chat.name)
                }
            }
        }
    }
}

#Preview {
    ChatListView()
}
