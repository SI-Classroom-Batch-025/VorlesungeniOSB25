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
                .resizable() // Muss gemacht werden, wenn man ein Bild von der Größe her verändern möchte
                .scaledToFill() // Füllmodus, Bild wird füllt Dimensionen aus
                //.scaledToFit() // Füllmodus, bild wird an die Dimensionen angepasst
                .frame(width: 66)
                .clipped() // Erzwingt, das das Bild in dem Bereich bleibt
            VStack(alignment: .leading) {
                Text(book.name)
                    .font(.title3)
                    .fontWeight(.black)
                    //.padding()
                    //.border(.red, width: 2)
                
                Divider()
                HStack {
                    Text("von \(book.author)")
                        //.font(.system(size: 20))
                    //.foregroundStyle(.myBlue)
                    //.padding(.trailing, 20)
                    Divider()
                    Text("\(book.rating) Sterne")
                }
                .font(.system(size: 14))
            }
        }
        .padding()
        .frame(height: 100)
        //.background(.red)
        .clipShape(.rect(cornerRadius: 12)) // Fügt abgerundete Ecken hinzu
        .background {
            Rectangle()
                .clipShape(.rect(cornerRadius: 12))
                .foregroundStyle(.white)
                .shadow(radius: 2) // Fügt einen Schatten dem Hintergrund hinzu
        } // Background mit {} gibt uns die Möglichkeit auch komplexere Hintergründe hinzuzufügen
        .padding(.horizontal)
        
    }
}

#Preview {
    BookView(book: Book(name: "Harry Potter", author: "J.K. Rowling", rating: 5))
}
