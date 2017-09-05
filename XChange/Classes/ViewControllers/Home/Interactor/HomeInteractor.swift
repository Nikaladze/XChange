//
//  HomeHomeInteractor.swift
//  XChange
//
//  Created by Nick Voloshyn on 25/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

class HomeInteractor: HomeInteractorInput {

    weak var output: HomeInteractorOutput!

    
//    MARK: - Private methods
    
    func getCachedCurrencies() {
//        output.homeInteractorOutput(didFetchCurrencies: CoreDataSimpleItems.convertToCurrencyItems(coredata: CoreDataMethods.sharedInstance.cachedCurrencies))
        output.homeInteractorOutput(didFetchCurrencies: CoreDataSimpleItems.convertRealmToCurrencyItems(coredata: CoreDataMethods.sharedInstance.currenciesRealm))
        
    }
    
    
//    MARK: - Protocol methods
    
//    MARK: HomeInteractorInput
    
    func homeInteractorInputViewIsReady() {
        getCachedCurrencies()
        WebServices.sharedInstance.getLatest(for: nil) { [weak weakSelf = self] (result) in
            if let currencyItems = result {
                for item in currencyItems {
//                    _ = CoreDataMethods.sharedInstance.addCurrencyRates(item)
                    _ = CoreDataMethods.sharedInstance.addCurrencyRatesRealm(item)
                }
                weakSelf?.getCachedCurrencies()
            }
        }
    }
    
}
