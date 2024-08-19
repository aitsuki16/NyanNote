//
//  CoreDataManager.swift
//  NyanNote
//
//  Created by user on 2024/01/26.
//

import Foundation
import CoreData

class CoreDataManager {
    static var shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "NyanNote")
        container.loadPersistentStores{_,
            error in
            if let error = error {
                fatalError("Failed to add coredata:\(error)")
            }
            
        }
        
        return container
    }()
    
    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try
                managedObjectContext.save()
            }  catch {
                let nsError = error as NSError
                fatalError("unresolved error\(nsError),\(nsError.userInfo)")
            }
        }
    }
}
