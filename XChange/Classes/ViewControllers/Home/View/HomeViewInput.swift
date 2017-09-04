//
//  HomeHomeViewInput.swift
//  XChange
//
//  Created by Nick Voloshyn on 25/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

protocol HomeViewInput: class {

    /**
        @author Nick Voloshyn
        Setup initial state of the view
    */

    func setupInitialState(forCurrencies items: Array<CurrencyItem>)
}
