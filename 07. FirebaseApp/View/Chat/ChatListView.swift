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
                    ChatItemView(chat: chat)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(.init()) // NavLink
            }
            .scrollContentBackground(.hidden)
            .listRowSpacing(10)
            .background(.siDeepPurple)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        chatViewModel.showAddChatSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            } // List
        }
        .sheet(isPresented: $chatViewModel.showAddChatSheet) {
            sheetView()
        } // NavStack
    }
    
    @ViewBuilder
    func sheetView() -> some View {
        VStack(spacing: 50) {
            Text("Create a new chat!")
                .font(.largeTitle)
                .foregroundStyle(.siYellow)
            
            TextField("Chatname", text: $chatViewModel.newChatName)
                .textFieldStyle(.appStyle)
            
            Button("Create chat") {
                chatViewModel.createChat()
            }
            .buttonStyle(.appStyle)
            .font(.title2) // Button
        }
        .padding(40)
        .presentationDetents([.medium])
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.siDeepPurple.opacity(0.9)) // VStack
    }
}

#Preview {
    ChatListView()
}
