//
//  Employee+CoreDataProperties.swift
//  CoreDataSwiftUIDemo
//
//  Created by Minhaz on 02/12/21.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var devices: [Device]?
    @NSManaged public var city: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var asset: NSSet?

}

// MARK: Generated accessors for asset
extension Employee {

    @objc(addAssetObject:)
    @NSManaged public func addToAsset(_ value: Device)

    @objc(removeAssetObject:)
    @NSManaged public func removeFromAsset(_ value: Device)

    @objc(addAsset:)
    @NSManaged public func addToAsset(_ values: NSSet)

    @objc(removeAsset:)
    @NSManaged public func removeFromAsset(_ values: NSSet)

}

extension Employee : Identifiable {

}
