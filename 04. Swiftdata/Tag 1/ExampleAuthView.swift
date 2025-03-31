//
//  ExampleAuthView.swift
//  04. Swiftdata
//
//  Created by Felix B on 31.03.25.
//

import SwiftUI

struct ExampleAuthView: View {
    
    @AppStorage("email") private var email: String = ""
    @AppStorage("nightMode") private var nightMode: Bool = false
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("E-mail", text: $email)
                .textFieldStyle(.roundedBorder)
                .foregroundStyle(.black)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .foregroundStyle(.black)
            Button("Login") {
                
            }
            .buttonStyle(.borderedProminent)
            
            Toggle("Nachtmodus", isOn: $nightMode)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(nightMode ? .black : .white)
        .foregroundStyle(nightMode ? .white : .black)
    }
}

#Preview {
    ExampleAuthView()
}
