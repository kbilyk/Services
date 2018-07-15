//
//  Service+CoreDataProperties.swift
//  Services
//
//  Created by Kostiantyn Bilyk on 15.07.18.
//  Copyright © 2018 Kostiantyn Bilyk. All rights reserved.
//
//

import Foundation
import CoreData


extension Service {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Service> {
        return NSFetchRequest<Service>(entityName: "Service")
    }

    @NSManaged public var info: String?
    @NSManaged public var name: String?
    @NSManaged public var orderItems: NSSet?

}

// MARK: Generated accessors for orderItems
extension Service {

    @objc(addOrderItemsObject:)
    @NSManaged public func addToOrderItems(_ value: OrderItem)

    @objc(removeOrderItemsObject:)
    @NSManaged public func removeFromOrderItems(_ value: OrderItem)

    @objc(addOrderItems:)
    @NSManaged public func addToOrderItems(_ values: NSSet)

    @objc(removeOrderItems:)
    @NSManaged public func removeFromOrderItems(_ values: NSSet)

}
