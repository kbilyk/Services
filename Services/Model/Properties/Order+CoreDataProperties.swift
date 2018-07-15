//
//  Order+CoreDataProperties.swift
//  Services
//
//  Created by Kostiantyn Bilyk on 15.07.18.
//  Copyright © 2018 Kostiantyn Bilyk. All rights reserved.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var isPaid: Bool
    @NSManaged public var customer: Customer?
    @NSManaged public var items: NSSet?

}

// MARK: Generated accessors for items
extension Order {

    @objc(addItemsObject:)
    @NSManaged public func addToItems(_ value: OrderItem)

    @objc(removeItemsObject:)
    @NSManaged public func removeFromItems(_ value: OrderItem)

    @objc(addItems:)
    @NSManaged public func addToItems(_ values: NSSet)

    @objc(removeItems:)
    @NSManaged public func removeFromItems(_ values: NSSet)

}
