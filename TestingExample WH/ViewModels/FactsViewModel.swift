//
//  FactsViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

@MainActor
class FactsViewModel: ObservableObject {
    
    @Published var fact: Fact?
    @Published var errorMessage = ""
    
    private let factRepo = FactRepository()
    
    func getFact() {
        // Damit wir async Funktionen überhaupt ausführen dürfen, muss die async Funktion innerhalb einer anderen async Funktion oder innerhalt einer Task ausgeführt werden.
        Task {
            // Damit wir try benutzen können muss eines der folgenden Sachen vorhanden sein:
            // 1. Wir benutzen das try innerhalb einer "throws" funktion
            // 2. Wir erstellen einen do-try-catch block (Hilft auch beim Fehlerhandling)
            // 3. Wir benutzen try? (Schlechtes Fehlerhandling)
            do {
                self.fact = try await factRepo.getFact()
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
