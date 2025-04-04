//
//  Comment.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 04.04.25.
//

import SwiftData
import Foundation

@Model
class Comment {
    var content: String
    var timestamp: Date
    
    var post: Post?
    var commentedBy: AppUser?
    
    init(content: String, timestamp: Date = .now, post: Post? = nil, commentedBy: AppUser? = nil) {
        self.content = content
        self.timestamp = timestamp
        self.post = post
        self.commentedBy = commentedBy
    }
}
