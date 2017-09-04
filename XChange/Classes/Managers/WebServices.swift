//
//  WebServices.swift
//  dreams
//
//  Created by Nick Voloshyn on 6/24/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation
import Alamofire

final class WebServices {
    
//    MARK: Local variables
    
    private struct APIMethods {
        static let baseAPImethod: String = "https://api.fixer.io"
        static let latest: String = APIMethods.baseAPImethod + "/latest"
    }
    
    
//    MARK: - Instance initialization
    
    static let sharedInstance: WebServices = {
        let instance = WebServices()
        return instance
    }()
    
    
    private init() {
        
    }
    
    
//    MARK: - Interface methods
    
    func getLatest(for parameters: Dictionary<String, String>?,
                   completionBlock: (([CurrencyItem]?) -> Void)?) -> Void {
        Alamofire.request(APIMethods.latest, parameters: parameters).responseJSON { [weak weakSelf = self] (response) in
            var result: Array<CurrencyItem> = []
            if let json = response.result.value as? Dictionary<String, Any> {
                if let base = json["base"] as? String {
                    let descriptionDict = weakSelf?.currencyDescription(forCurrency: base)
                    result.append(CurrencyItem(name: descriptionDict?.name,
                                               code: base,
                                               symbol: descriptionDict?.symbol,
                                               rate: 1.0))
                    if let rateArray = json["rates"] as? Dictionary<String, Float> {
                        for currency in rateArray {
                            let descriptionDict2 = weakSelf?.currencyDescription(forCurrency: currency.key)
                            result.append(CurrencyItem(name: descriptionDict2?.name,
                                                       code: currency.key,
                                                       symbol: descriptionDict2?.symbol,
                                                       rate: currency.value))
                        }
                    }
                }
            }
            
            completionBlock?(result)
        }
        
        
    }
    
    
    func currencyDescription(forCurrency code: String) -> (name: String, symbol: String) {
        if let descriptionDict = CurrencyDescription.sharedInstance.currencyDescription[code] {
            return (descriptionDict["name"] as! String, descriptionDict["symbol"] as! String)
        } else {
            return ("", "")
        }
        
    }
    
}
