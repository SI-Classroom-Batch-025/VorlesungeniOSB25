//
//  MessageRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 15.05.25.
//

import FirebaseFirestore

protocol MessageRepository {
    func createMessage(chatID: String, message: Message) throws
    func addMessageSnapshotListener(
        chatID: String,
        onChange: @escaping ([Message]) -> Void
    ) -> ListenerRegistration?
}
