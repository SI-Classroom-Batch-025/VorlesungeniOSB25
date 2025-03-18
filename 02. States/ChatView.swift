//
//  ChatView.swift
//  02. States
//
//  Created by Felix B on 18.03.25.
//

import SwiftUI

struct ChatView: View {
    
    let chat: Chat
    
    var body: some View {
        ForEach(chat.messages) { message in // Im Falle, dessen das wir ein Array haben, von nicht identifiable Objekten, müsen wir z.B. die ID explizit angeben (, id: \.id)
            HStack {
                Text(message.id.uuidString)
                Text(message.content)
            }
        }
    }
}

#Preview {
    ChatView(
        chat: .init(
            name: "Testnamen",
            members: [],
            messages: [
                Message(
                    from: "username1",
                    content: "Hallo!",
                    timestamp: .now
                ),
                Message(
                    from: "username1",
                    content: "Hallo?",
                    timestamp: .now
                )
            ]
        )
    )
}
