//
//  Currency+CoreDataClass.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/25/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation
import CoreData

@objc(Currency)
public class Currency: NSManagedObject {
    
    class func currency(moc: NSManagedObjectContext?) -> Currency? {
        if let entityMOC = moc {
            let entityDescription = NSEntityDescription.entity(forEntityName: Constants.Enteties.Currency,
                                                               in: entityMOC)
            let newEntry = NSManagedObject(entity: entityDescription!,
                                           insertInto: entityMOC)
            return newEntry as? Currency
        } else {
            return nil
        }
    }

}
