//
//  MemesRepository.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

class MemesRepository {
    
    
    func getMemes() async throws -> [Meme] {
        let urlString = "https://api.imgflip.com/get_memes"
        guard let url = URL(string: urlString) else {
            throw HTTPError.malformedURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
//        print(data)
        // Optionaler teil, besseres errorhandling
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode >= 400 {
            throw HTTPError.badResponse
        }
        
        let memeResponse = try JSONDecoder().decode(MemeResponse.self, from: data)
        return memeResponse.data.memes
    }
}
