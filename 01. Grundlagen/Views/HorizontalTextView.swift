//
//  HorizontalTextView.swift
//  01. Grundlagen
//
//  Created by Justus Finke on 11.03.25.
//

import SwiftUI

struct HorizontalTextView: View {
    var body: some View {
        HStack{
            Text("1. Text")
                .font(.title)
            Spacer()
            Text("2. Text")
                .bold()
            Spacer()
            Text("3. Text")
        }
        .padding()
        .background(.green)
        .padding(5)
        .border(.green, width: 3)
    }
}

#Preview {
    HorizontalTextView()
}
