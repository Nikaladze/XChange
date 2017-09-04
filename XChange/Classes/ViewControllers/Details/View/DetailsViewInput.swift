//
//  DetailsDetailsViewInput.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

protocol DetailsViewInput: class {

    /**
        @author Nick Voloshyn
        Setup initial state of the view
    */

    func setupInitialState(withCurrencies items: Array<DetailItem>)
    func detailsViewInput(updated items: Array<CurrencyItem>, forCurrency model: CurrencyItem)
    
}
