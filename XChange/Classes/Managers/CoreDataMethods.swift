//
//  CoreDataMethods.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/25/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation

final class CoreDataMethods {
    
    private var cod: CoreDatastoreRoutines?
    private var _cachedCurrencies: Array<Currency>?
    
    var cachedCurrencies: Array<Currency> {
        get {
            if _cachedCurrencies != nil {
                return _cachedCurrencies!
            } else {
                return []
            }
        }
    }
    
    
//    MARK: - Instance initialization
    
    static let sharedInstance : CoreDataMethods = {
        let instance = CoreDataMethods()
        return instance
    }()
    
    
    private init() {
        cod = CoreDatastoreRoutines()
        self.fetchCurrencyRates { [weak weakSelf = self] (result) in
            weakSelf?._cachedCurrencies = result
        }
    }
    
    
//    MARK: - Interface methods
    
    func save() {
        cod?.saveContext()
    }
    
    
    func fetchCurrencyRates(completionBlock: (([Currency]?) -> Void)!) {
        cod?.fetchItem(with: nil,
                       entityName: Constants.Enteties.Currency,
                       sortDescriptors: []) { (result) in
                        completionBlock(result as? [Currency])
        }
    }
    
    
    func addCurrencyRates(_ currencyItem: CurrencyItem) -> Currency? {
        var result: Currency? = cachedCurrencies.filter( {$0.code == currencyItem.code} ).first
        if (result != nil) {
            result?.rate = currencyItem.rate
        } else {
            result = Currency.currency(moc: cod?.managedObjectContext)
            result?.code = currencyItem.code
            result?.rate = currencyItem.rate
            result?.name = currencyItem.name
            result?.symbol = currencyItem.symbol
            _cachedCurrencies?.append(result!)
        }
        return result
        
    }
    
}
