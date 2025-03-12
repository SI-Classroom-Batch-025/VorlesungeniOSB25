//
//  BookView.swift
//  01. Grundlagen
//
//  Created by Felix B on 12.03.25.
//

import SwiftUI

struct BookView: View {
    
    var book: Book
    
    var body: some View {
        HStack {
            Image("cloud")
                .resizable()
                .scaledToFill()
                //.scaledToFit()
                .frame(width: 66)
                .clipped()
            VStack(alignment: .leading) {
                Text(book.name)
                    .font(.title3)
                    .bold()
                Divider()
                HStack {
                    Text("von \(book.author)")
                    //.foregroundStyle(.myBlue)
                    //.padding(.trailing, 20)
                    Divider()
                    Text("\(book.rating) Sterne")
                }
            }
        }
        .padding()
        .frame(height: 100)
        //.background(.red)
        .clipShape(.rect(cornerRadius: 12))
        .background {
            Rectangle()
                .clipShape(.rect(cornerRadius: 12))
                .foregroundStyle(.white)
                .shadow(radius: 2)
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    BookView(book: Book(name: "Harry Potter", author: "J.K. Rowling", rating: 5))
}
