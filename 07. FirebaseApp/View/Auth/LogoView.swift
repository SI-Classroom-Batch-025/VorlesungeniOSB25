//
//  LogoView.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 16.05.25.
//

import SwiftUI

struct LogoView: View {
    
    private let foreGroundGradient = LinearGradient(
        colors: [.siPurple, .siPink, .siYellow],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        VStack {
            Image("camera")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 120)
            
            Text("Synstagram")
                .font(.largeTitle)
                .kerning(5)
                .bold()
                .padding(.bottom, 60)
        }
        .foregroundStyle(foreGroundGradient)
    }
}



#Preview {
    LogoView()
}
