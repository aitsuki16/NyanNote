//
//  RecordedSoundsViewController.swift
//  NyanNote
//
//  Created by user on 2024/01/28.
//

import UIKit
import CoreData

class RecordedSoundsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
//    var dataSource = RecordedSoundsDataSource()

        override func viewDidLoad() {
            super.viewDidLoad()

//            tableView.dataSource = dataSource

            fetchRecordedSounds()
        }

    func fetchRecordedSounds() {
        let coreDataManager = CoreDataManager.shared
        
        // Use the correct type for fetchRequest
        let fetchRequest: NSFetchRequest<Sounds> = Sounds.fetchRequest()

        do {
//            dataSource.recordedSounds = try coreDataManager.managedObjectContext.fetch(fetchRequest)
            tableView.reloadData()
        } catch {
            print("Error fetching recorded sounds: \(error.localizedDescription)")
        }
    }



}
