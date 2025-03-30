//
//  AnimatedBackground.swift
//  03. Navigation
//
//  Created by Felix B on 28.03.25.
//

import SwiftUI

struct AnimatedBackground: View {
    
    @Binding var colors: [Color]
    
    private var opacityColors: [Color] {
        colors.map { color in
            color.opacity(opacity)
        }
    }
    
    @State private var opacity = 1.0
    @State private var startPoint: UnitPoint = .topLeading
    @State private var endPoint: UnitPoint = .bottomTrailing
    
    var body: some View {
        LinearGradient(
            colors: opacityColors,
            startPoint: startPoint,
            endPoint: endPoint
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 5).repeatForever(autoreverses: true)) {
                startPoint = .bottomLeading
                endPoint = .topTrailing
                opacity = 0.5
            }
        }
    }
}

#Preview {
    AnimatedBackground(colors: .constant([.yellow, .orange, .red]))
}
