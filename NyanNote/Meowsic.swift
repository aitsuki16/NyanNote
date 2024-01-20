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
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
