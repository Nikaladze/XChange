//
//  DetailsDetailsInteractor.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

class DetailsInteractor: DetailsInteractorInput {

    weak var output: DetailsInteractorOutput!
    
//    MARK: - Protocol methods
    
//    MARK: DetailsInteractorInput
    
    func detailsInteractorInput(prepareTableItemsFor items: Array<CurrencyItem>) {
        var result: Array <DetailItem> = []
        for item in items {
            var subitems: Array<CurrencyItem> = []
            for subitem in items {
                if item.code != subitem.code {
                    let insertedItem = CurrencyItem(name: subitem.name, code: subitem.code, symbol: subitem.symbol, rate: subitem.rate / item.rate)
                    subitems.append(insertedItem)
                }
            }
            result.append(DetailItem(curencyItem: item, rates: subitems))
        }
        output.detailsInteractorOutput(preparedDataForTables: result)
    }
    
    
    func detailsInteractorInput(updateDataForCurrency model: CurrencyItem) {
        WebServices.sharedInstance.getLatest(for: ["base": model.code!]) { [weak weakSelf = self] (result) in
            if result?.count ?? 0 > 0 {
                weakSelf?.output.detailsInteractorOutput(updated: result, forCurrency: model)
            }
        }
    }

}
