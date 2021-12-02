//
//  Device+CoreDataProperties.swift
//  CoreDataSwiftUIDemo
//
//  Created by Minhaz on 02/12/21.
//
//

import Foundation
import CoreData


extension Device {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Device> {
        return NSFetchRequest<Device>(entityName: "Device")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var person: Employee?

}

extension Device : Identifiable {

}
