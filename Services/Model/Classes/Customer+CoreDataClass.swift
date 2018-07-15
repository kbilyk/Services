//
//  Customer+CoreDataClass.swift
//  Services
//
//  Created by Kostiantyn Bilyk on 15.07.18.
//  Copyright © 2018 Kostiantyn Bilyk. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Customer)
public class Customer: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataManager.sharedInstance.entity(forEntityName: NSStringFromClass(Customer.self)), insertInto: CoreDataManager.sharedInstance.persistentContainer.viewContext)
    }
}
