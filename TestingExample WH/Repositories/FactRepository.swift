//
//  FactRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

class FactRepository {
    
    func getFact() async throws -> Fact {
        let urlString = "https://uselessfacts.jsph.pl/api/v2/facts/random?language=de"
        guard let url = URL(string: urlString) else {
            throw HTTPError.malformedURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
//        print(data)
        // Optionaler teil, besseres errorhandling
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 400 {
            throw HTTPError.badResponse
        }
        
        return try JSONDecoder().decode(Fact.self, from: data)
    }
}
