//
//  SoundViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 26.06.25.
//

import SwiftUI
import AVKit
import Combine

@MainActor
class SoundViewModel: ObservableObject {
    
    @Published var progress: Double = 0.0
    @Published var duration: Double = 0.0
    
    private var audioPlayer: AVAudioPlayer?
    private var audioTimer: AnyCancellable?
    
    func playSound(forResource: String, ofType: String) {
        // Mit Bundle.main.path finden wir den exakten Ort unserer File heraus.
        guard let path = Bundle.main.path(forResource: forResource, ofType: ofType) else {
            return
        }
        // Falls die soundfile online liegt, dann muss das ganze auf AVPlayer(url: URL) abgändert werden.
        // let player = AVPlayer(url: <#T##URL#>)
        do {
            // Wir erstellen den Audioplayer, mit dem Dateninhalt von dem Pfad den wir vorher herausgesucht haben.
            let player = try AVAudioPlayer(contentsOf: URL(filePath: path))
            self.audioPlayer = player
            
            self.duration = player.duration
            
            audioTimer = Timer.publish(every: 1, on: .main, in: .common)
                .autoconnect()
                .sink { [weak self] _ in
                    self?.progress = self?.audioPlayer?.currentTime ?? 0.0
                }
            
            // Startet die audiowiedergabe
            player.play()
        } catch {
            print(error)
        }
    }
    
    func skipTo(time: Double) {
        self.audioPlayer?.currentTime = time
    }
    
    func togglePauseResume() {
        guard let audioPlayer else { return }
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        } else {
            audioPlayer.play()
        }
    }
    
    func stopSound() {
        audioPlayer?.stop()
        audioTimer?.cancel()
        audioPlayer = nil
        audioTimer = nil
        progress = 0
        duration = 0
    }
}
