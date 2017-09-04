//
//  DetailsDetailsInteractorInput.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import Foundation

protocol DetailsInteractorInput {
    
    func detailsInteractorInput(prepareTableItemsFor items: Array<CurrencyItem>)
    func detailsInteractorInput(updateDataForCurrency model: CurrencyItem)
    
}
