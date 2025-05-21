//
//  SymbolAnimationView.swift
//  ExampleSwiftTesting
//
//  Created by Felix B on 21.05.25.
//

import SwiftUI

struct SymbolAnimationView: View {
    
    @State private var ownAnimationState = false
    @State private var sfSymbolState = false
    @State private var scaleEffect = 1.0
    
    @State private var text = ""
    @State private var isInvalidInput = false
    @State private var counter = 0
    
    private let animationSpeed = 10.0
    private let offset: CGFloat = 15
    private let repeatCount = 3
    
    var body: some View {
        Button {
            ownAnimationState.toggle()
        } label: {
            Text(ownAnimationState ? "😁" : "🥲")
                .font(.system(size: 50))
        }
        .scaleEffect(scaleEffect)
        .onChange(of: ownAnimationState) { oldValue, newValue in
            if newValue {
                withAnimation(.bouncy) {
                    scaleEffect = 2.0
                } completion: {
                    withAnimation(.bouncy) {
                        scaleEffect = 1.0
                    }
                }
            }
        }

        
        Button {
            sfSymbolState.toggle()
        } label: {
            Image(systemName: sfSymbolState ? "sun.max.fill" : "trash")
                .resizable()
                .frame(width: 50, height: 50)
        }
        .symbolEffect(.rotate, value: sfSymbolState)
        //.symbolEffect(.bounce, value: stateChanged)
        
        TextField("Input...", text: $text)
            .padding()
            .background(.gray, in: .buttonBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.red, lineWidth: isInvalidInput ? 3 : 0)
            }
            .offset(x: isInvalidInput ? (counter % 2 == 0 ? offset : -offset) : 0)
            .padding(.horizontal, 40)
            .animation(.easeInOut.speed(animationSpeed), value: isInvalidInput)
        
        Button("Login") {
            if text.count < 4 {
                invalidateInput()
            }
        }
    
    }
    
    func invalidateInput() {
        withAnimation() {
            isInvalidInput = true
        } completion: {
            isInvalidInput = false
            
            if counter <= repeatCount {
                counter += 1
                invalidateInput()
            } else {
                counter = 0
            }
        }

    }
}

#Preview {
    SymbolAnimationView()
}
