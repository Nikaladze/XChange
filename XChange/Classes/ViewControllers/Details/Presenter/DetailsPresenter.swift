//
//  DetailsDetailsPresenter.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

class DetailsPresenter: DetailsModuleInput, DetailsViewOutput, DetailsInteractorOutput {

    weak var view: DetailsViewInput!
    var interactor: DetailsInteractorInput!
    var router: DetailsRouterInput!

    
//    MARK: - Protocol methods
    
//    MARK: DetailsViewOutput
    
    func viewIsReady(forCurrencies items: Array<CurrencyItem>) {
        interactor.detailsInteractorInput(prepareTableItemsFor: items)
    }
    
    
    func detailsViewOutput(updateDataForCurrency model: CurrencyItem?) {
        if let _ = model {
            interactor.detailsInteractorInput(updateDataForCurrency: model!)
        }
    }
    
    
//    MARK: DetailsInteractorOutput
    
    func detailsInteractorOutput(preparedDataForTables items: Array<DetailItem>) {
        view.setupInitialState(withCurrencies: items)
    }
    
    
    func detailsInteractorOutput(updated items: Array<CurrencyItem>?, forCurrency model: CurrencyItem) {
        if let result = items?.filter( {$0.code != model.code} ) {
            view.detailsViewInput(updated: result, forCurrency: model)
        }
    }
    
}
