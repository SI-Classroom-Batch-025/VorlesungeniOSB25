//
//  Pokemon.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 22.04.25.
//

struct PokemonDataResponse: Codable {
    var data: [PokemonCard]
}

struct PokemonCard: Codable, Identifiable {
    var id: String
    var name: String
    var supertype: String
    var images: PokemonCardImages
    var flavorText: String?
}

struct PokemonCardImages: Codable {
    var small: String
    var large: String
}
