//
//  HTTPError.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.05.25.
//

enum HTTPError: String, Error {
    case malformedURL = "URL ist ungültig."
    case badResponse = "Statuscode >= 400"
}
