//
//  CoreDataSimpleItems.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/25/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation

struct CurrencyItem {
    let name: String?
    let code: String?
    let symbol: String?
    let rate: Float
}


struct DetailItem {
    let curencyItem: CurrencyItem?
    var rates: Array<CurrencyItem>?
}


class CoreDataSimpleItems {
    
    class func convertToCurrencyItem(coredata currencyItem: Currency) -> CurrencyItem {
        return CurrencyItem(name: currencyItem.name,
                            code: currencyItem.code,
                            symbol: currencyItem.symbol,
                            rate: currencyItem.rate)
        
    }

    
    class func convertToCurrencyItems(coredata currencyItems: Array<Currency>) -> Array<CurrencyItem> {
        var result: Array<CurrencyItem> = []
        for item in currencyItems {
            result.append(CoreDataSimpleItems.convertToCurrencyItem(coredata: item))
        }
        return result
    }
    
    
    class func convertRealmToCurrencyItem(coredata currencyItem: CurrencyRealm) -> CurrencyItem {
        return CurrencyItem(name: currencyItem.name,
                            code: currencyItem.code,
                            symbol: currencyItem.symbol,
                            rate: Float(currencyItem.rate))
        
    }
    
    
    class func convertRealmToCurrencyItems(coredata currencyItems: Array<CurrencyRealm>) -> Array<CurrencyItem> {
        var result: Array<CurrencyItem> = []
        for item in currencyItems {
            result.append(CoreDataSimpleItems.convertRealmToCurrencyItem(coredata: item))
        }
        return result
    }
    
}
