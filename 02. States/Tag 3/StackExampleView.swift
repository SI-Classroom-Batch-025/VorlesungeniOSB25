//
//  StackExampleView.swift
//  02. States
//
//  Created by Felix B on 18.03.25.
//

import SwiftUI

struct StackExampleView: View {
    
    @Binding var selectedValue: String
    
    let selectionArray: [String]

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(selectionArray, id: \.self) { entry in
                    Image(systemName: entry)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .onTapGesture {
                            selectedValue = entry
                        }
                        .foregroundStyle(selectedValue == entry ? .red : .black)
                }
            }
            .padding()
        }
    }
}

#Preview {
    StackExampleView(selectedValue: .constant(""), selectionArray: ["globe", "wrench", "person", "bubble", "person.3"])
}
