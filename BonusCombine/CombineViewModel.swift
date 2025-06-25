//
//  CombineViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 25.06.25.
//

import SwiftUI
import Combine

@MainActor
class CombineViewModel: ObservableObject {
    @Published var input: String = ""
    @Published var textIsValid: Bool = false
    @Published var counter = 0
    @Published var timerDate = Date()
    @Published var posts: [Post] = []
    @Published var errorMessage = ""
    
    private var timer: AnyCancellable? = nil
    private var cancelables = Set<AnyCancellable>()
    // Array = Ansammlung von bestimmten Objekten, egal ob sie doppelt sind oder nicht, [0, 0, 0, 1, 2, 2]
    // Set = Ansammlung von bestimmten Objekten, aber es darf keine Doppelten geben [0, 1, 2]
    
    init() {
        observeInput()
        startTimer()
    }
    
    func getPostsWithCombine() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("Posts successfully fetched.")
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { posts in
                self.posts = posts
            }
            .store(in: &cancelables)
            
    }
    
    func getPostsWithoutCombine() {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        
        guard let url = URL(string: urlString) else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                self.posts = try JSONDecoder().decode([Post].self, from: data)
            } catch {
                
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] publishedDate in
                self?.counter += 1
                self?.timerDate = publishedDate
            }
    }
    
    private func observeInput() {
        $input
            .map { input in
                input.count > 2
            }
            .assign(to: &$textIsValid)
    }
    
    func isTextValid(input: String) {
        textIsValid = input.count > 2
        // Das ist das selbe wie hier unten, nur viel kürzer
//        if input.count > 2 {
//            textIsValid = true
//        } else {
//            textIsValid = false
//        }
    }
}
