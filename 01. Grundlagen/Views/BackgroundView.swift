//
//  BackgroundView.swift
//  01. Grundlagen
//
//  Created by Felix B on 13.03.25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
