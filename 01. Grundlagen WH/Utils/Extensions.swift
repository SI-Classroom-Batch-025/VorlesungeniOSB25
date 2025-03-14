//
//  Extensions.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 14.03.25.
//

import SwiftUI

extension View {
    func headlineStyling() -> some View {
        self
            .font(.title)
            .frame(maxWidth: .infinity)
            .background(.red)
    }
}
