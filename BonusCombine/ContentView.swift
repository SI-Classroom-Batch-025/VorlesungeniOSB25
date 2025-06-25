//
//  ContentView.swift
//  BonusCombine
//
//  Created by Felix B on 24.06.25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var combineViewModel = CombineViewModel()
    
    var body: some View {
        VStack {
            TextField("Input", text: $combineViewModel.input)
//                .onChange(of: combineViewModel.input) { oldValue, newValue in
//                    combineViewModel.isTextValid(input: newValue)
//                }
            Text("Der input ist valide? \(combineViewModel.textIsValid)")
            
            Text("Der timer ist bei: \(combineViewModel.counter)")
            Text("Der timer ist bei: \(combineViewModel.timerDate.formatted(date: .omitted, time: .complete))")
            
            Button("Get Posts") {
                //combineViewModel.getPostsWithoutCombine()
                combineViewModel.getPostsWithCombine()
            }
            
            Text(combineViewModel.errorMessage)
                .foregroundStyle(.red)
            
            List(combineViewModel.posts) { post in
                Text(post.title)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
