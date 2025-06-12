//
//  Strings.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 12.06.25.
//

import SwiftUI

struct Strings {
    static let loginButton = LocalizedStringKey("login_button")
    static let registerButton = LocalizedStringKey("register_button")
    static let usernameHint = LocalizedStringKey("username_hint")
    static let passwordHint = LocalizedStringKey("password_hint")
    static let welcomeText = LocalizedStringKey("welcome_text")
    func usernameCharacterCount(_ count: Int) -> LocalizedStringKey {
        LocalizedStringKey("username_charactercount_\(count)")
    }
}
