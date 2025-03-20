//
//  ChatMessageView.swift
//  01. Grundlagen
//
//  Created by Felix B on 13.03.25.
//

import SwiftUI

struct ChatMessageView: View {
    
    @State var isFromSelf: Bool
    
    var body: some View {
        HStack {
            if isFromSelf {
                Spacer()
            }
        
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .background {
                    // Control + M um parameter untereinander anzuordnen
                    UnevenRoundedRectangle(
                        topLeadingRadius: 10,
                        bottomLeadingRadius: isFromSelf ? 10 : 0,
                        bottomTrailingRadius: isFromSelf ? 0 : 10,
                        topTrailingRadius: 10
                    )
                    .foregroundStyle(isFromSelf ? .gray : .green)
                    
                    
                }
            
            if !isFromSelf {
                Spacer()
            }
        }
        Button("Switch fromself") {
            isFromSelf.toggle()
        }
    }
}

#Preview {
    ChatMessageView(isFromSelf: true)
}
