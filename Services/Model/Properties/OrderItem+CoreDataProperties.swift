//
//  OrderItem+CoreDataProperties.swift
//  Services
//
//  Created by Kostiantyn Bilyk on 15.07.18.
//  Copyright © 2018 Kostiantyn Bilyk. All rights reserved.
//
//

import Foundation
import CoreData


extension OrderItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OrderItem> {
        return NSFetchRequest<OrderItem>(entityName: "OrderItem")
    }

    @NSManaged public var price: Float
    @NSManaged public var order: Order?
    @NSManaged public var service: Service?

}
