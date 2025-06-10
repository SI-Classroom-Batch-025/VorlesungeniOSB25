//
//  ChatItemView.swift
//  07. FirebaseApp
//
//  Created by Felix B on 16.05.25.
//

import SwiftUI

// Eine einzelne Zeile in der ChatListView
struct ChatItemView: View {
    
    // Das Datenmodell für einen Chat wird beim erstellen der View übergeben
    let chat: Chat
    
    var body: some View {
        // Bild links, Text rechts
        HStack(alignment: .top) {
            // Lokales Asset mit Namen „placeholder“
            Image("placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 75, height: 75)
                .clipped() // Schneidet überstehende Bildteile ab (falls sie über das Frame hinausgehen)
                .clipShape(.rect(cornerRadius: 4))
                .overlay {
                    // Schwarzer Rand um das Bild
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.black, lineWidth: 1)
                } // Image
            
            // Chat-Name und ggf. spätere Zusatzinfos
            VStack(alignment: .leading) {
                Text(chat.name) // Anzeige des Chat-Namens
                    .font(.title)
                
                // TODO: chat erweitern um "last message" und hier einfügen?
            } // VStack
        }
        .padding(8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white, in: .rect(cornerRadius: 8)) // HStack
    }
}
