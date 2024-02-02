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
    
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    var recordingURL: URL?
    var meowsicPlayer = Meowsic()
    var isRecording = false
    var audioFileName: String {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("recordedSound.wav").path

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func keyOneTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m1")
    }
    
    @IBAction func keyTwoTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m2")
    }
    
    @IBAction func ketThreeTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m3")
    }
    @IBAction func keyFourTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m4")
    }
    
    @IBAction func keyFiveTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m5")
    }
    
    @IBAction func keySixTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m6")
    }
    
    @IBAction func keySevenTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m7")
    }
    
    @IBAction func keyEightTapped(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m8")
        
    }
    
    @IBAction func blackKeyOne(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "m9")
        
    }
    
    @IBAction func blackKeyTwo(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "1")
        
    }
    @IBAction func blackKeyThree(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "2")
        
    }
    
    @IBAction func blackKeyFour(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "3")
        
    }
    @IBAction func blackKeyFive(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "4")
        
    }
    
    @IBAction func blackKeySix(_ sender: UIButton) {
        meowsicPlayer.playSound(fileName: "5")
        
    }
    
    @IBAction func recordButtonTapped(_ sender: UIButton) {
        if isRecording {
            audioRecorder?.stop()
            isRecording = false
            
            saveRecordedSound()
        } else {
            
            startRecording()
            isRecording = true
        }
    }
    
    @IBAction func musicListButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PianoViewController", bundle: nil)
            let recordedSoundsVC = storyboard.instantiateViewController(withIdentifier: "RecordedSoundsViewController") as! RecordedSoundsViewController
            self.present(recordedSoundsVC, animated: true, completion: nil)
    }

    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default, options: [])
            try audioRecorder = AVAudioRecorder(url: URL(fileURLWithPath: audioFileName), settings: [:])
            audioRecorder?.prepareToRecord()
            audioRecorder?.record()
            
            meowsicPlayer.playSound(fileName: "m1")
        } catch {
            print("Error starting recording: \(error.localizedDescription)")
        }
    }
    
    func saveRecordedSound() {
        let coreDataManager = CoreDataManager.shared

        // sounds object
        let newRecordedSound = Sounds(context: coreDataManager.managedObjectContext)
        newRecordedSound.title = "Sound"
        newRecordedSound.path = URL(fileURLWithPath: audioFileName)

        coreDataManager.saveContext()

        // Fetch 
        fetchRecordedSounds()
    }
    
    func fetchRecordedSounds() {
     
    }
    
}
