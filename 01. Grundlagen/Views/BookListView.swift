//
//  BookListView.swift
//  01. Grundlagen
//
//  Created by Felix B on 12.03.25.
//

import SwiftUI

struct BookListView: View {
    
    let books: [Book] = [
        Book(name: "Harry Potter", author: "J.K. Rowling", rating: 4),
        Book(name: "Bibel", author: "Unbekannt", rating: 4),
        Book(name: "Der Keller", author: "Fitzek", rating: 5),
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                BookView(book: books[0])
                BookView(book: books[1])
                BookView(book: books[2])
                BookView(book: books[2])
                BookView(book: books[2])
                BookView(book: books[2])
                BookView(book: books[2])
                BookView(book: books[2])
                BookView(book: books[2])
                BookView(book: books[2])
                BookView(book: books[2])
                BookView(book: books[2])
            }
            .padding(.vertical) // Abstand oben und unten
        }
        .padding(.bottom) // Abstand unten
        ScrollView {
            BookView(book: books[0])
            BookView(book: books[1])
            BookView(book: books[2])
            BookView(book: books[2])
            BookView(book: books[2])
            BookView(book: books[2])
            BookView(book: books[2])
            BookView(book: books[2])
            BookView(book: books[2])
            BookView(book: books[2])
            BookView(book: books[2])
            BookView(book: books[2])
        }
    }
}

#Preview {
    BookListView()
}
