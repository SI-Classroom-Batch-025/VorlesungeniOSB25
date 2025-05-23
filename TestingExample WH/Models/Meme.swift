//
//  Meme.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

struct MemeResponse: Codable {
    var success: Bool
    var data: MemeData
}

struct MemeData: Codable {
    var memes: [Meme]
}

struct Meme: Codable, Identifiable {
    var id: String
    var name: String
    var url: String
    var captions: Int
}

/*
 {
    "success": true,
    "data": {
        "memes": [
            {
                "id": "181913649",
                "name": "Drake Hotline Bling",
                "url": "https://i.imgflip.com/30b1gx.jpg",
                "width": 1200,
                "height": 1200,
                "box_count": 2,
                "captions": 1424250
            }
        ]
    }
 }
 */
