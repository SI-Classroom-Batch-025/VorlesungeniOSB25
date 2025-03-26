//
//  CardDeckExample.swift
//  03. Navigation
//
//  Created by Felix B on 26.03.25.
//

import SwiftUI

struct CardDeckExample: View {
    
    let cards = ["A", "7", "8", "9", "10", "B", "D", "K"]
    
    var body: some View {
        NavigationStack {
            List(cards, id: \.self) { card in
                NavigationLink {
                    SheetExample()
                    // Wenn wir den backbutton nicht haben wollen z.B. wenn wir nicht wollen das der Nutzer zurücknavigieren kann über den Button oder einen eigenen einbauen wollen.
                        //.navigationBarBackButtonHidden()
                } label: {
                    Text(card)
                }
            }
        }
    }
}

#Preview {
    CardDeckExample()
}
