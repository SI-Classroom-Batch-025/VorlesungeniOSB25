//
//  ChatMessageView.swift
//  01. Grundlagen
//
//  Created by Felix B on 13.03.25.
//

import SwiftUI

struct ChatMessageView: View {
    
    let isFromSelf: Bool
    
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
                    
                    
                    //                if isFromSelf {
                    //                    UnevenRoundedRectangle(
                    //                        topLeadingRadius: 10,
                    //                        bottomLeadingRadius: 10,
                    //                        bottomTrailingRadius: 0,
                    //                        topTrailingRadius: 10
                    //                    )
                    //                    .foregroundStyle(.gray)
                    //                } else {
                    //                    UnevenRoundedRectangle(
                    //                        topLeadingRadius: 10,
                    //                        bottomLeadingRadius: 0,
                    //                        bottomTrailingRadius: 10,
                    //                        topTrailingRadius: 10
                    //                    )
                    //                    .foregroundStyle(.green)
                    //                }
                    
                }
            
            if !isFromSelf {
                Spacer()
            }
        }
    }
}

#Preview {
    ChatMessageView(isFromSelf: true)
}
