//
//  ChatRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import FirebaseFirestore

protocol ChatRepository {
    func createChat(_ chat: Chat) throws // C
    func getChats(_ userID: String) async throws -> [Chat] // R
    func addUserToChat(chatID: String, userID: String) // U
    func removeUserFromChat(chatID: String, userID: String) // U
    func deleteChat(chatID: String) // D
    func addChatSnapshotListener(
        userID: String,
        onChange: @escaping ([Chat]) -> Void
    ) -> ListenerRegistration?
}
