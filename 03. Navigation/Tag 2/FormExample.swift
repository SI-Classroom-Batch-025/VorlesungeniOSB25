//
//  FormExample.swift
//  03. Navigation
//
//  Created by Felix B on 25.03.25.
//

import SwiftUI

struct FormExample: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    
    @FocusState private var focus: FocusFields?
    
    enum FocusFields {
        case email, password, username
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Email", text: $email)
                    .focused($focus, equals: .email)
                
                SecureField("Password", text: $password)
                    .focused($focus, equals: .password)
                
                TextField("Username", text: $username)
                    .focused($focus, equals: .username)
            }
            .onSubmit {
                switch focus {
                case .email:
                    focus = .password
                case .password:
                    focus = .username
                case .username:
                    focus = nil
                default:
                    focus = nil
                }
            }
            
            Button("Login") {
                
            }
            
//            HStack {
//                // Falls ihr den Fall haben solltet, das ihr mehrere Buttons in einer Reihe haben wollt, müsst ihr darauf achten, wenigstens einem der Buttons einen "bordered" button style zu geben, damit dieser dann nicht den kompletten Listeneintrag einnimmt.
//                Button("Button1") {
//                    print("Ja")
//                }
//                .buttonStyle(.borderedProminent)
//
//                Button("Button2") {
//                    print("Nein")
//                }
//                .buttonStyle(.borderedProminent)
//            }
        }
    }
}

#Preview {
    FormExample()
}
