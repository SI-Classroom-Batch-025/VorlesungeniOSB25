//
//  NumberView.swift
//  02. States
//
//  Created by Felix B on 18.03.25.
//

import SwiftUI

struct NumberView: View {
    
    let testArray: [String] = [
        "1",
        "2",
        "3",
        "4",
        "1",
    ]
    
    var body: some View {
        ScrollView {
            ForEach(testArray, id: \.self) { element in
                Text(element)
            }
        }
    }
}

#Preview {
    NumberView()
}
