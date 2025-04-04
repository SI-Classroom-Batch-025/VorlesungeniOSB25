//
//  DebugView.swift
//  04. Swiftdata WH
//
//  Created by Felix B on 04.04.25.
//

import SwiftUI
import SwiftData

struct DebugView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query private var users: [AppUser]
    @Query private var posts: [Post]
    @Query private var comments: [Comment]
    
    var body: some View {
        List(users) { user in
            VStack {
                Text(user.username)
                Text(user.posts.description)
                Text(user.comments.description)
            }
        }
        List(posts) { post in
            VStack {
                Text(post.title)
                Text(post.postedBy?.username ?? "Kein User")
                Text(post.comments.description)
            }
        }
        List(comments) { comment in
            VStack {
                Text(comment.content)
                Text(comment.post?.title ?? "Kein Title")
                Text(comment.commentedBy?.username ?? "Kein User")
            }
        }
        Button("Add User") {
            context.insert(AppUser(username: "Test", password: "test"))
        }
        Button("Add Post") {
            context.insert(Post(title: "TestTitle", content: "OAKSFHJSKD", timestamp: .now, postedBy: users[0]))
        }
        Button("Add Comment") {
            context.insert(Comment(content: "FHALKJSHDL", timestamp: .now, post: posts[0], commentedBy: users[0]))
        }
    }
}

#Preview {
    DebugView()
        .modelContainer(for: [AppUser.self, Comment.self, Post.self], inMemory: true)
}
