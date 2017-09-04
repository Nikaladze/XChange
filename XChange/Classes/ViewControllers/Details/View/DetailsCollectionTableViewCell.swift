//
//  DetailsCollectionTableViewCell.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/26/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class DetailsCollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    
    private var _model: CurrencyItem?
    var model: CurrencyItem? {
        set {
            _model = newValue
            setup(forCurrency: _model!)
        }
        get {
            return _model
        }
    }
    
    func setup(forCurrency model: CurrencyItem) {
        codeLabel.text = model.code
        let rateText = model.rate.format(f: ".3")
        rateLabel.text = "\(rateText) \(model.symbol ?? "")"
        symbolLabel.text = model.name ?? "Unknown"
    }

    
    
}
