//
//  RecordedSound.swift
//  NyanNote
//
//  Created by user on 2024/01/26.
//

import Foundation
import CoreData

class RecordedSound: NSManagedObject {
    
    @NSManaged var title: String
    @NSManaged var fileURL: String
    
}
