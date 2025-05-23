//
//  MemeView.swift
//  TestingExample WH
//
//  Created by Felix B on 23.05.25.
//

import SwiftUI

struct MemeView: View {
    
    @StateObject private var memesViewModel = MemesViewModel()
    
    var body: some View {
        VStack {
            List(memesViewModel.memes) { meme in
                Text(meme.name)
                AsyncImage(url: URL(string: meme.url)) { image in
                    image.resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(.buttonBorder)
                } placeholder: {
                    ProgressView()
                }
            }
            Button("Get memes") {
                memesViewModel.getMemes()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    MemeView()
}
