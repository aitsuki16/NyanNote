//
//  Meowsic.swift
//  NyanNote
//
//  Created by user on 2024/01/20.
//

import Foundation
import AVFoundation


class Meowsic {

    var audioPlayer: AVAudioPlayer?

    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "wav") else {
        
            print("File not found for \(fileName).mp3")

            return
        }
        print("Playing sound from URL: \(url)")


        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
