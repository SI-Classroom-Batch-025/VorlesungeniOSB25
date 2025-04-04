//
//  PostDetailView.swift
//  04. Swiftdata WH
//
//  Created by Felix B on 04.04.25.
//

import SwiftUI

struct PostDetailView: View {
    
    let post: Post
    
    @Binding var loggedInUser: AppUser?
    
    @Environment(\.modelContext) private var context
    
    @State private var commentInput = ""
    
    var body: some View {
        VStack {
            ScrollView {
                if let image = post.image {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(.buttonBorder)
                }
                Text(post.title)
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom)
                Text(post.content)
                
                if post.comments.isEmpty {
                    Text("Noch keine Kommentare")
                } else {
                    List(post.comments) { comment in
                        CommentListItem(comment: comment)
                            .listRowBackground(Color.clear)
                    }
                    .frame(height: 300)
                    .listStyle(.plain)
                }
            }
            .foregroundStyle(.yellow)
            
            HStack {
                TextField("Schreibe ein Kommentar", text: $commentInput)
                    .textFieldStyle(.appStyle)
                Button {
                    comment()
                } label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                .buttonStyle(.appStyle)
            }
        }
        .padding()
        .background(.purple.mix(with: .black, by: 0.4))
    }
    
    private func comment() {
        let comment = Comment(content: commentInput)
        post.comments.append(comment)
        comment.post = post
        comment.commentedBy = loggedInUser
        try? context.save()
        commentInput = ""
    }
}

#Preview {
    PostDetailView(post: previewPost, loggedInUser: .constant(nil))
        .modelContainer(for: AppUser.self)
}
