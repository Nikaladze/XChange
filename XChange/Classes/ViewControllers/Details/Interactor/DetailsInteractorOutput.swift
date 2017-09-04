//
//  DetailsDetailsInteractorOutput.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation

protocol DetailsInteractorOutput: class {
    
    func detailsInteractorOutput(preparedDataForTables items: Array<DetailItem>)
    func detailsInteractorOutput(updated items: Array<CurrencyItem>?, forCurrency model: CurrencyItem)

}
