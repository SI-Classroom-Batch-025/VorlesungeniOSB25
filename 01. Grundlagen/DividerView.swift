//
//  DividerView.swift
//  01. Grundlagen
//
//  Created by Justus Finke on 11.03.25.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        VStack{
            Text("Oben")
            Divider()
                .overlay(.black)
            HStack{
                Text("Links")
                Divider()
                    .overlay(.black)
                Text("Rechts")
            }
            Divider()
                .overlay(.black)
            Text("Unten")
            
        }
    }
}

#Preview {
    DividerView()
}
