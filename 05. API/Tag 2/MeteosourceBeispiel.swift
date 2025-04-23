//
//  MeteosourceBeispiel.swift
//  05. API
//
//  Created by Felix B on 23.04.25.
//

import SwiftUI

struct MeteosourceBeispiel: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    
    private func getWeather() async throws -> Weather {
        let urlString = "https://www.meteosource.com/api/v1/free/point?place_id=london&sections=all&timezone=UTC&language=en&units=metric"

        guard let url = URL(string: urlString) else {
            throw HTTPError.urlMalformed
        }
      
        let headers = [
            "X-API-Key": "<API Key>"
        ]
            
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
            
        let (data, _) = try await URLSession.shared.data(for: request)
        let weather = try JSONDecoder().decode(Weather.self, from: data)
        
        return weather
    }
}

#Preview {
    MeteosourceBeispiel()
}
