//
//  CurrencyDescription.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/25/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation

class CurrencyDescription {
    
    private var _currencyDescription: Dictionary<String, Dictionary<String, Any>> = [:]
    
    var currencyDescription: Dictionary<String, Dictionary<String, Any>> {
        get {
            if _currencyDescription.count != 0 {
                return _currencyDescription
            } else {
                _currencyDescription = self.readJson()
                return _currencyDescription
            }
        }
    }

    
//    MARK: - Instance initialization
    
    static let sharedInstance : CurrencyDescription = {
        let instance = CurrencyDescription()
        return instance
    }()
    
    
    private init() {
        _ = currencyDescription
    }
    
    
//    MARK: - Private methods
    
    private func readJson() -> Dictionary<String, Dictionary<String, Any>> {
        do {
            if let file = Bundle.main.url(forResource: "Common-Currency", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let finalJSON = json as? Dictionary<String, Dictionary<String, Any>> {
                    return finalJSON
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return [:]
    }

}
