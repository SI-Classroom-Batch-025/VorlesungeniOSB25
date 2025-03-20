//
//  ForYouPageView.swift
//  02. States
//
//  Created by Felix B on 18.03.25.
//

import SwiftUI

struct Post: Identifiable {
    var image: String
    var id = UUID()
}

struct ForYouPageView: View {
    
    var posts = [
        Post(image: "cloud"),
        Post(image: "cloud"),
        Post(image: "cloud"),
        Post(image: "cloud"),
        Post(image: "cloud"),
        Post(image: "cloud"),
        Post(image: "cloud"),
        Post(image: "cloud"),
        Post(image: "cloud")
    ]
    
    var body: some View {
        
        LazyVGrid(
            columns: [
                .init(.adaptive(minimum: 100)),
                .init(.adaptive(minimum: 100))
            ]
        ) {
            ForEach(posts) { post in
                Image(post.image)
                    .resizable()
                    .scaledToFit()
            }
        }
        
        
//        Grid {
//            // Damit wir immer die richtige Anzahl an Reihen haben, müssen wir diese basierend auf der Anzahl der posts berechnen, wir wollen immer 3 in einer Reihe anzeigen also teilen wir die Gesamtanzahl durch 3, da es eine Int Division ist, wäre 2/3 = 0 damit wir dann aber noch wenigstens eine Reihe haben, addieren wir +1
//            ForEach(0..<posts.count / 3 + 1) { row in
//                GridRow {
//                    // Genau 3 posts pro reihe
//                    ForEach(0..<3) { offset in
//                        // Damit wir kein Index out of bounds in der letzten Reihe bekommen können
//                        if offset + row * 3 < posts.count {
//                            Image(posts[offset + row * 3])
//                                .resizable()
//                                .scaledToFit()
//                        }
//                    }
//                }
//            }
//        }
        
        
//        Grid {
//            GridRow {
//                Image("cloud")
//                    .resizable()
//                    .frame(height: 300)
//                Image(.toast)
//                    .resizable()
//                    .scaledToFit()
//            }
//            GridRow {
//                Image("cloud")
//                    .resizable()
//                    .scaledToFit()
//                Image("cloud")
//                    .resizable()
//                    .scaledToFit()
//            }
//        }
        
        
        // Das hier ist mehr eine ForYouPage, bilder sind in 2 Spalten und können auch unterschiedlich groß sein
//        HStack {
//            VStack {
//                Image("cloud")
//                    .resizable()
//                    .frame(height: 300)
//                Image(.toast)
//                    .resizable()
//                    .scaledToFit()
//                Spacer()
//            }
//            
//            VStack {
//                Image("cloud")
//                    .resizable()
//                    .scaledToFit()
//                Image("cloud")
//                    .resizable()
//                    .scaledToFit()
//                Spacer()
//            }
//        }
    }
}

#Preview {
    ForYouPageView()
}
