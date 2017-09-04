//
//  Currency+CoreDataProperties.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/26/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation
import CoreData


extension Currency {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Currency> {
        return NSFetchRequest<Currency>(entityName: "Currency")
    }

    @NSManaged public var name: String?
    @NSManaged public var rate: Float
    @NSManaged public var code: String?
    @NSManaged public var symbol: String?

}
