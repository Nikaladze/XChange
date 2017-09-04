//
//  HomeTableViewCell.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/25/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    private var _model: CurrencyItem?
    
    var model: CurrencyItem? {
        set {
            _model = newValue
            setup(for: _model!)
        }
        get {
            return _model
        }
    }
    
    
//    MARK: - Interface methods
    
    private func setup(for model: CurrencyItem) {
        codeLabel.text = model.code
        nameLabel.text = model.name
        symbolLabel.text = model.symbol
    }
}
