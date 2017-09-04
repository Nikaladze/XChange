//
//  HomeHomePresenter.swift
//  XChange
//
//  Created by Nick Voloshyn on 25/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {

    weak var view: HomeViewInput!
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    
    
//    MARK: - Protocol methods
    
//    MARK: HomeViewOutput

    func viewIsReady() {
        interactor.homeInteractorInputViewIsReady()
    }
    
    
//    MARK: HomeInteractorOutput
    
    func homeInteractorOutput(didFetchCurrencies items: Array<CurrencyItem>) {
        if items.count > 0 {
            view.setupInitialState(forCurrencies: items)
        }
    }
    
    
}
