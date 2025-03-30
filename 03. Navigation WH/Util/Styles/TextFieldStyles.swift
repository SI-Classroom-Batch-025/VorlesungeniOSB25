//
//  TextFieldStyles.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 28.03.25.
//

import SwiftUI

struct AppTextFieldStyle: TextFieldStyle {
    
    @FocusState private var textFieldFocus: Bool
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background()
            .clipShape(.buttonBorder)
            .focused($textFieldFocus)
            .onTapGesture {
                textFieldFocus = true
            }
    }
}

extension TextFieldStyle where Self == AppTextFieldStyle {
    static var appStyle: AppTextFieldStyle { AppTextFieldStyle() }
}

#Preview {
    @Previewable @State var messageInput = ""
    ZStack {
        Color.black
        TextField("...", text: $messageInput)
            .textFieldStyle(.appStyle)
    }
}
