//
//  DetailsCollectionViewCell.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/26/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewDataSource: DetailsTVDataSource?
    
    var delegate: DetailsCollectionViewCellDelegate?
    
    private var _model: DetailItem?
    var model: DetailItem? {
        set {
            _model = newValue
            setup(for: _model!)
        }
        get {
            return _model
        }
    }
    
    
//    MARK: - Instance initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
//    MARK: - Private methods
    
    private func setup(for model: DetailItem) {
        codeLabel.text = "1 \(model.curencyItem?.code ?? "Unknown") (\(model.curencyItem?.symbol ?? "")):"
        nameLabel.text = model.curencyItem?.name
        tableViewDataSource = DetailsTVDataSource()
        tableViewDataSource?.itemsArray = model.rates ?? []
        tableView.dataSource = tableViewDataSource
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0),
                              at: .top,
                              animated: false)
        tableView.reloadData()
    }
    
    
//    MARK: - Action methods
    
    @IBAction func reloadButtonDidTapped(_ sender: Any) {
        delegate?.detailsCollectionViewCellDelegate(reloadDidTappedFor: model?.curencyItem)
    }
        
}
