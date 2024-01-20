//
//  PianoViewController.swift
//  NyanNote
//
//  Created by user on 2024/01/20.
//

import Foundation
import UIKit
import AVFoundation

class PianoViewController: UIViewController {
    
    @IBOutlet weak var keyOne: UIButton!
    @IBOutlet weak var keyTwo: UIButton!
    @IBOutlet weak var keyThree: UIButton!
       @IBOutlet weak var keyFour: UIButton!
    @IBOutlet weak var keyFive: UIButton!
    @IBOutlet weak var keySix: UIButton!
       @IBOutlet weak var keySeven: UIButton!
    
    var audioPlayer: AVAudioPlayer?
     var audioRecorder: AVAudioRecorder?
     var recordingURL: URL?
    var meowsicPlayer = Meowsic()

     
     override func viewDidLoad() {
         super.viewDidLoad()
     
     }
    
    @IBAction func keyOneTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "archivo1")
        }
    @IBAction func keyTwoTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "archivo7")

    }
    @IBAction func keyThreeTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "archivo2")
        }
    @IBAction func keyFourTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "archivo3")
        }
    @IBAction func keyFiveTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "archivo4")
        }
    @IBAction func keySixTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "archivo5")
        }
    @IBAction func keySevenTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "archivo6")
        }
}
