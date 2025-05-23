//
//  CardView.swift
//  ExampleSwiftTesting
//
//  Created by Felix B on 22.05.25.
//

import SwiftUI

struct CardView: View {
    
    let title: String
    let accepted: () -> Void
    let declined: () -> Void
    
    @State private var offset = CGSize.zero
    
    var rotation: Double {
        Double(offset.width) / 10
    }
    
    var offsetColorOpacity: Double {
        0.0 + abs(Double(offset.width / 400))
    }
    
    var body: some View {
        
        Text(title)
            .frame(width: 200, height: 300)
            .padding(50)
            .background {
                Color.gray.mix(with: .white, by: 0.6)
            }
            .overlay {
                offset.width > 0
                ? Color.green.opacity(offsetColorOpacity)
                : offset.width < 0
                ? Color.red.opacity(offsetColorOpacity)
                : Color.white.opacity(0.0)
            }
            .clipShape(.buttonBorder)
            .offset(x: offset.width)
            .rotationEffect(.degrees(rotation))
//            .opacity(1.0 - abs(Double(offset.width / 250)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { gesture in
                        if gesture.translation.width > 100 {
                            accepted()
                        } else if gesture.translation.width < -100 {
                            declined()
                        } else {
                            offset = .zero
                        }
                    }
            )
            .shadow(color: .black, radius: 4)

    }
}

#Preview {
    CardView(title: "Test1") {
        
    } declined: {
        
    }
}
