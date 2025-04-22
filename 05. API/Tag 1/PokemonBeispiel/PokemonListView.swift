//
//  PokemonListView.swift
//  05. API
//
//  Created by Felix B on 22.04.25.
//

import SwiftUI

struct PokemonListView: View {
    
    @State var pokemonCards: [PokemonCard] = []
    
    var body: some View {
        Button("Get Cards") {
            // Starten einen weiteren Thread, welcher im Hintergrung läuft
            Task {
                do {
                    self.pokemonCards = try await getCards()
                } catch {
                    print(error)
                }
            }
        }
        List(pokemonCards) { card in
            AsyncImage(url: URL(string: card.images.large)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
    }
    
    func getCards() async throws -> [PokemonCard] {
        // Deklarieren den Endpunkt
        let urlString = "https://api.pokemontcg.io/v2/cards"
        
        // Verifizieren die URL
        guard let url = URL(string: urlString) else {
            throw HTTPError.urlMalformed
        }
        
        // Ziehen die Daten von der API (Wird ein großer String sein)
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decodieren die bekommenen Daten (welche ein großer JSON String sein sollten) in das gewünschte Objekt
        let pokemonResponse = try JSONDecoder().decode(PokemonDataResponse.self, from: data)
        
        return pokemonResponse.data
    }
}

#Preview {
    PokemonListView()
}
