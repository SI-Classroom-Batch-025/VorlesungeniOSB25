//
//  AppUser.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 04.04.25.
//

import SwiftData

@Model
class AppUser {
    var username: String
    var password: String
    
    @Relationship(deleteRule: .cascade, inverse: \Post.postedBy)
    var posts: [Post]
    
    @Relationship(deleteRule: .cascade, inverse: \Comment.commentedBy)
    var comments: [Comment]
    
    init(username: String, password: String, posts: [Post] = [], comments: [Comment] = []) {
        self.username = username
        self.password = password
        self.posts = posts
        self.comments = comments
    }
}
