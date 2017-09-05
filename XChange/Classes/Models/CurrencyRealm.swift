//
//  CurrencyRealm.swift
//  XChange
//
//  Created by Nick Voloshyn on 9/5/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import RealmSwift

class CurrencyRealm: Object {
    
    dynamic var name = ""
    dynamic var rate = 1.0
    dynamic var code = ""
    dynamic var symbol = ""
    
}
