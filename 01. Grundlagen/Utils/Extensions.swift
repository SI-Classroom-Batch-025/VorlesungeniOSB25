//
//  Extensions.swift
//  01. Grundlagen
//
//  Created by Felix B on 13.03.25.
//

import SwiftUI

extension View {
    func appButtonStyle() -> some View {
        self
            .buttonStyle(.borderedProminent)
            .tint(.yellow)
            .foregroundStyle(.black)
    }
}

