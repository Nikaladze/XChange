//
//  DetailsDetailsViewOutput.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

protocol DetailsViewOutput {

    /**
        @author Nick Voloshyn
        Notify presenter that view is ready
    */

    func viewIsReady(forCurrencies items: Array<CurrencyItem>)
    func detailsViewOutput(updateDataForCurrency model: CurrencyItem?)
    
}
