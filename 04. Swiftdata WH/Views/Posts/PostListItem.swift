//
//  PostListItem.swift
//  04. Swiftdata WH
//
//  Created by Felix B on 04.04.25.
//

import SwiftUI

struct PostListItem: View {
    
    let post: Post
    
    var body: some View {
        HStack(alignment: .top) {
            Image(post.image != nil ? post.image! : "placeholder")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(.buttonBorder)
            
            VStack(alignment: .leading) {
                Text(post.title)
                    .font(.title)
                Text(post.timestamp.formatted(date: .numeric, time: .omitted))
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding(8)
        .background()
        .clipShape(.buttonBorder)
    }
}

#Preview {
    ZStack {
        Color.purple.mix(with: .black, by: 0.4)

        PostListItem(post: previewPost)
    }
}
