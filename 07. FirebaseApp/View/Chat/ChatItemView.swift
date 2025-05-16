//
//  ChatItemView.swift
//  07. FirebaseApp
//
//  Created by Felix B on 16.05.25.
//

import SwiftUI

struct ChatItemView: View {
    
    let chat: Chat
    
    var body: some View {
        HStack(alignment: .top) {
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .clipped()
                .clipShape(.rect(cornerRadius: 4))
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 1)
                } // Image
            
            VStack(alignment: .leading) {
                Text(chat.name)
                    .font(.title)
                
                // TODO: chat erweitern um "last message" und hier einfügen?
            } // VStack
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white, in: .rect(cornerRadius: 8)) // HStack
    }
}
