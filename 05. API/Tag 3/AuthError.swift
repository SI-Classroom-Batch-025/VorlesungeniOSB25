//
//  AuthError.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 25.04.25.
//

import SwiftUI

struct AuthError: LocalizedError {
    let fieldName: String

    var errorDescription: String? {
        "Das Feld \"\(fieldName)\" enthält einen ungültigen Wert."
    }

    var recoverySuggestion: String? {
        "Bitte stellen Sie sicher, dass das Feld \"\(fieldName)\" ausgefüllt ist"
    }
}

struct LoginError: LocalizedError {

    var errorDescription: String? {
        "Fehler beim einloggen."
    }

    var recoverySuggestion: String? {
        "Passwort oder Username scheint ungültig zu sein."
    }
}
