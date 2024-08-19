//
//  Sounds+CoreDataProperties.swift
//  NyanNote
//
//  Created by user on 2024/01/28.
//
//

import Foundation
import CoreData


extension Sounds {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sounds> {
        return NSFetchRequest<Sounds>(entityName: "Sounds")
    }

    @NSManaged public var title: String?
    @NSManaged public var path: URL?
    @NSManaged public var creationDate: Date?


}

extension Sounds : Identifiable {

}
