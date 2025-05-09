//
//  WebSerivce.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 09.05.25.
//

import Foundation

class WebService {
    func getData<T: Decodable>(for urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(T.self, from: data)
        
        return response
    }
}
