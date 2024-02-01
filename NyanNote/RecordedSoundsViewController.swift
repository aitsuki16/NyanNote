//
//  RecordedSoundsViewController.swift
//  NyanNote
//
//  Created by user on 2024/01/28.
//

import UIKit
import CoreData
import AVFoundation

class RecordedSoundsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    var recordedSounds: [Sounds] = []
    var audioPlayer: AVAudioPlayer?
        override func viewDidLoad() {
            super.viewDidLoad()

           tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RecordedSoundCell")

            fetchRecordedSounds()
        }

    func fetchRecordedSounds() {
        let coreDataManager = CoreDataManager.shared
        let fetchRequest: NSFetchRequest<Sounds> = Sounds.fetchRequest()

        do {
            recordedSounds = try coreDataManager.managedObjectContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch {
            print("Error fetching recorded sounds: \(error.localizedDescription)")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordedSounds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "RecordedSoundCell", for: indexPath)
         let recordedSound = recordedSounds[indexPath.row]
         cell.textLabel?.text = recordedSound.title
         return cell
     }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let recordedSound = recordedSounds[indexPath.row]
            playRecordedSound(at: recordedSound.path)
        }
    
    func playRecordedSound(at url: URL?) {
        guard let url = url else { return }
        
        do {
             audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing recorded sound: \"(error.localizedDescription")
        }
    }
    

}
