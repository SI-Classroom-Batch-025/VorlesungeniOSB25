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
        let viewModel = MessageViewModel(chatID: chatID)
        self._messageViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            List(messageViewModel.messages) { message in
                let fromSelf = message.senderID == messageViewModel.userID
                MessageItemView(message: message, fromSelf: fromSelf)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    .rotationEffect(.degrees(180))
            }
            .listStyle(.plain)
            .rotationEffect(.degrees(180)) // List
            
            HStack {
                TextField("...", text: $messageViewModel.messageInput)
                    .textFieldStyle(.appStyle)
                
                Button {
                    messageViewModel.createMessage()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                }
                .buttonStyle(.appStyle)
                .frame(width: 55, height: 55) // Button
            }
            .padding(10)
            .background(.siPurple) // HStack
        }
        .background(.siDeepPurple)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    messageViewModel.showAddUserSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $messageViewModel.showAddUserSheet) {
            sheetView()
        } // VStack

    }
    
    @ViewBuilder
    func sheetView() -> some View {
        VStack(spacing: 50) {
            
            Text("Add a User!")
                .foregroundStyle(.siYellow)
                .font(.largeTitle)
            
            TextField("Username", text: $messageViewModel.username)
                .textFieldStyle(.appStyle)
            
            Button("Add User") {
                messageViewModel.addUserToChat()
            }
            .buttonStyle(.appStyle)
            .font(.title2) // Button
        }
        .padding(40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.siDeepPurple.opacity(0.9))
        .presentationDetents([.medium]) // VStack
    }
}

#Preview {
    NavigationStack {
        MessageListView(chatID: "l07ALbYEHSWyzakQzF76")
    }
}
