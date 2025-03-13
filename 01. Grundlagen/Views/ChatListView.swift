//
//  ChatListView.swift
//  01. Grundlagen
//
//  Created by Felix B on 13.03.25.
//

import SwiftUI

struct ChatListView: View {
    var body: some View {
        ScrollView {
            VStack {
                ChatMessageView(isFromSelf: true)
                ChatMessageView(isFromSelf: false)
                ChatMessageView(isFromSelf: true)
                ChatMessageView(isFromSelf: false)
                ChatMessageView(isFromSelf: true)
                ChatMessageView(isFromSelf: true)
            }
            .padding()
        }
    }
}

#Preview {
    ChatListView()
}
