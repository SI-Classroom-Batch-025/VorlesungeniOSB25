//
//  Apikey.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.04.25.
//

import SwiftUI

let apiKey = "aosjfpajshdpahspdioaspüdiajsd"

var getAPIKey: String {
    guard let filePath = Bundle.main.path(forResource: "Config", ofType: "plist") else {
        return ""
    }
    
    let plist = NSDictionary(contentsOfFile: filePath)
    
    guard let apiKey = plist?.object(forKey: "API_KEY") as? String else {
        return ""
    }
    
    return apiKey
}
