//
//  MultiplyView.swift
//  02. States
//
//  Created by Felix B on 17.03.25.
//

import SwiftUI

struct MultiplyView: View {
    
    @Binding var counter: Int
    
    var body: some View {
        HStack {
            Button("Mal 2") {
                counter *= 2
            }
            .buttonStyle(.bordered)
            
            Button("Geteilt durch 2") {
                counter /= 2
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    MultiplyView(counter: .constant(0))
}
