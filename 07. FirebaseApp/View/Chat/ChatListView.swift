//
//  ChatListView.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import SwiftUI

// Eine Ansicht, welche eine Liste aller Chats darstellt
struct ChatListView: View {
    // Das ViewModel wird als StateObject eingebunden, damit es über die gesamte Lebensdauer
    // der View bestehen bleibt und bei Änderungen automatisch UI-Updates auslöst
    @StateObject private var chatViewModel = ChatViewModel()
    
    var body: some View {
        // Ermöglicht Navigation zu weiteren Views
        NavigationStack {
            // Dynamisch erzeugte Liste von Chats
            List(chatViewModel.chats) { chat in
                // Jeder Listeneintrag ist ein NavigationLink zur Nachrichtenansicht eines Chats
                NavigationLink {
                    MessageListView(chatID: chat.id!) // Navigationsziel beim Tippen
                } label: {
                    ChatItemView(chat: chat) // Was angezeigt wird
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(.init()) // Entfernt Standard-Einrückungen
            }
            .scrollContentBackground(.hidden)
            .listRowSpacing(10)
            .background(.siDeepPurple)
            .toolbar {
                // Toolbar-Button oben rechts zum Erstellen eines neuen Chats
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        chatViewModel.showAddChatSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            } // List
        }
        // Sheet (eine Art Pop-up von unten), das angezeigt wird, wenn showAddChatSheet true ist
        .sheet(isPresented: $chatViewModel.showAddChatSheet) {
            sheetView()
        } // NavStack
    }
    
    // Diese Funktion liefert den Inhalt für das Sheet zum Erstellen eines neuen Chats
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
