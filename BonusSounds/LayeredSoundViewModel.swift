//
//  LayeredSoundViewModel.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 26.06.25.
//

import SwiftUI
import AVKit

class LayeredSoundViewModel: NSObject, AVAudioPlayerDelegate, ObservableObject {
    
    private var audioPlayers: [AVAudioPlayer] = []
    
    func printSounds() {
        print(audioPlayers)
    }
    
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
            // Wichtige vergessene Zeile dafür, damit auch darauf geachtet wird, wenn der sound fertig ist
            player.delegate = self
            audioPlayers.append(player)
            
            
            // Startet die audiowiedergabe
            player.play()
        } catch {
            print(error)
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard let index = audioPlayers.firstIndex(of: player) else { return }
        audioPlayers.remove(at: index)
    }
}
