//
//  Webservice.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 22.04.25.
//

import SwiftUI

class Webservice {
    
    func get<DataType: Codable>(urlString: String) async throws -> DataType {
        guard let url = URL(string: urlString) else {
            throw HTTPError.urlMalformed
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(DataType.self, from: data)
        
        return response
    }
}
