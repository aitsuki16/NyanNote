//
//  RecordedSoundsViewController.swift
//  NyanNote
//
//  Created by user on 2024/01/28.
//

import UIKit
import CoreData

class RecordedSoundsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var recordedSounds: [Sounds] = []
        override func viewDidLoad() {
            super.viewDidLoad()

           tableView.dataSource = self

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
    

}
