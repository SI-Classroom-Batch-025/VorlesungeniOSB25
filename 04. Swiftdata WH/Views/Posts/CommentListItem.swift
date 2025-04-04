//
//  CommentItem.swift
//  04. Swiftdata WH
//
//  Created by Felix B on 04.04.25.
//

import SwiftUI

struct CommentListItem: View {
    
    let comment: Comment
    
    var body: some View {
        VStack {
            Text(comment.commentedBy?.username ?? "Anon")
            
            Text(comment.content)
        }
        .frame(maxWidth: .infinity)
        .foregroundStyle(.black)
        .background(.white)
        .clipShape(.buttonBorder)
    }
}

#Preview {
    CommentListItem(comment: Comment(content: "kjfajskkljasd"))
}
