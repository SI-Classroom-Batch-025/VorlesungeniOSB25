//
//  ArticleView.swift
//  01. Grundlagen WH
//
//  Created by Felix B on 14.03.25.
//

import SwiftUI

struct ArticleView: View {
    let article: Article
    
    var body: some View {
//        GeometryReader { proxy in
//            // Ist um prozentuale Werte für höhe und Breite zu bekommen
//        }
        
        VStack(spacing: 0) {
            Text(article.title)
                .font(.title)
                .bold()
                .padding(.bottom, 5)
            Divider()
                .padding(.bottom, 10)
            HStack(alignment: .top) {
                Image(article.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .clipShape(.rect(cornerRadius: 10))
                Text(article.content)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
            HStack {
                Text("- \(article.author)")
                Spacer()
                Text(article.postingDate.formatted())
            }
        }
        .frame(maxWidth: .infinity)
        .padding(10)
        .background(.gray.mix(with: .white, by: 0.3))
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    ArticleView(article: .init(title: "Testtitel", content: "Irgendwas ist passiert.", image: "toast", postingDate: .now, author: "Tester"))
}

/*
 Primitive Datentypen sind pretty much die kleinsten Bauteile die wir haben z.B.
 - Int
 - Double
 - Float
 - Byte
 - Char
 - Long
 - Short
 - Bool
 - (String) ist eigentlich ein array von Chars
 - (array)
 */
