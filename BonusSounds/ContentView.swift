//
//  ContentView.swift
//  BonusSounds
//
//  Created by Felix B on 25.06.25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var soundViewModel = SoundViewModel()
    @StateObject private var layeredViewModel = LayeredSoundViewModel()
    
    var body: some View {
        VStack {
            
            Button("Start layered Sound") {
                layeredViewModel.playSound(forResource: "menuselect", ofType: "mp3")
                layeredViewModel.printSounds()
            }
            
            Slider(value: Binding(get: {
                soundViewModel.progress
            }, set: { value in
                soundViewModel.skipTo(time: value)
            }), in: 0...soundViewModel.duration)

            HStack {
                Text("0")
                Spacer()
                Text(soundViewModel.progress.toTimedString())
                Spacer()
                Text(soundViewModel.duration.toTimedString())
            }
            .padding(.bottom, 30)
            
            HStack(spacing: 50) {
                Button {
                    soundViewModel.playSound(forResource: "C&S - End Credits", ofType: "mp3")
                } label: {
                    Image(systemName: "play.fill")
                }
                
                Button {
                    soundViewModel.togglePauseResume()
                } label: {
                    Image(systemName: "pause.fill")
                }
                
                Button {
                    soundViewModel.stopSound()
                } label: {
                    Image(systemName: "stop.fill")
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
