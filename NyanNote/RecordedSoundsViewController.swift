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
    var audioFileName: String = ""

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
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]

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

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDate = dateFormatter.string(from: recordedSound.creationDate ?? Date())

        //cell.textLabel?.text = recordedSound.title
        cell.textLabel?.text = "\(recordedSound.title ?? "") - \(formattedDate)"

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let recordedSound = recordedSounds[indexPath.row]
            playRecordedSound(at: recordedSound.path)
        print(recordedSound)

        }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            deleteRecordedSound(at: indexPath)
//
//        }
//    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completionHandler) in
            self?.deleteRecordedSound(at: indexPath)
            completionHandler(true)
        }

        deleteAction.backgroundColor = UIColor(named: "Color1")

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
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
    func saveRecordedSound() {
        let coreDataManager = CoreDataManager.shared

        // current date
        let currentDate = Date()

        // Create a new Sounds object
        let newRecordedSound = Sounds(context: coreDataManager.managedObjectContext)

        // Set the title, path, and creationDate
        newRecordedSound.title = "Sound \(currentDate)"
        newRecordedSound.path = URL(fileURLWithPath: audioFileName)
        newRecordedSound.creationDate = currentDate

        coreDataManager.saveContext()

        // Fetch recorded sounds
        fetchRecordedSounds()
    }
    
    func deleteRecordedSound(at indexPath: IndexPath) {
        let coreDataManager = CoreDataManager.shared
        let recordedSoundToDelete = recordedSounds[indexPath.row]
        
        coreDataManager.managedObjectContext.delete(recordedSoundToDelete)
        
        coreDataManager.saveContext()
        
        recordedSounds.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
