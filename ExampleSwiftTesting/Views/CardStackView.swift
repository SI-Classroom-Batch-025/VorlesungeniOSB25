//
//  CardStackView.swift
//  ExampleSwiftTesting
//
//  Created by Felix B on 22.05.25.
//

import SwiftUI

struct CardStackView: View {
    
    @State private var cards: [String] = [
        "Card 1",
        "Card 2",
        "Card 3",
        "Card 4",
        "Card 5",
        "Card 6",
    ]
    
    @State private var likedCards: [String] = []
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(cards, id: \.self) { card in
                    CardView(title: card) {
                        print("JA")
                        likedCards.append(card)
                        cards.removeLast()
                    } declined: {
                        print("Nein")
                        cards.removeLast()
                    }
                    .offset(y: CGFloat((cards.firstIndex(of: card) ?? 0) * -10))
                }
                
            }
            List(likedCards, id: \.self) { card in
                Text(card)
            }
            .frame(height: 100)
        }
    }
}

#Preview {
    CardStackView()
}
