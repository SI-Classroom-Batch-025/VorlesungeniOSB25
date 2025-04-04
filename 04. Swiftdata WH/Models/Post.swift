//
//  Post.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 04.04.25.
//

import SwiftData
import Foundation

@Model
class Post {
    var title: String
    var content: String
    var image: String?
    var timestamp: Date
    
    @Relationship(deleteRule: .cascade, inverse: \Comment.post)
    var comments: [Comment]
    var postedBy: AppUser?
    
    init(title: String, content: String, image: String? = nil, timestamp: Date = .now, comments: [Comment] = [], postedBy: AppUser? = nil) {
        self.title = title
        self.content = content
        self.image = image
        self.timestamp = timestamp
        self.comments = comments
        self.postedBy = postedBy
    }
}
