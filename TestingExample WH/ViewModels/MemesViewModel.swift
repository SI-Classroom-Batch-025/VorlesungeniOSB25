//
//  MemesViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

@MainActor
class MemesViewModel: ObservableObject {
    @Published var memes: [Meme] = []
    @Published var errorMessage = ""
    
    private let memeRepo = MemesRepository()
    
    func getMemes() {
        Task {
            do {
                self.memes = try await memeRepo.getMemes()
            } catch {
                if let httpError = error as? HTTPError {
                    self.errorMessage = httpError.rawValue
                } else {
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
