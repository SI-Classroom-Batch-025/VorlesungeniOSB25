//
//  Post.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 25.06.25.
//

struct Post: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
}
