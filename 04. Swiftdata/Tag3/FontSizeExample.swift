//
//  FontSizeExample.swift
//  04. Swiftdata
//
//  Created by Felix B on 02.04.25.
//

import SwiftUI

struct FontSizeExample: View {
    
    @State private var fontSize = 16.0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.system(size: fontSize))
        Slider(value: $fontSize, in: 10...60, step: 1)
        Text("Derzeitiger Fontsize ist \(String(format: "%.0f", fontSize))")
            .font(.system(size: fontSize))
    }
}

#Preview {
    FontSizeExample()
}
