//
//  DetailsVCCollectionDataSource.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/26/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class DetailsVCCollectionDataSource: NSObject, UICollectionViewDataSource, DetailsCollectionViewCellDelegate {
    
    var itemsArray: Array<DetailItem> = []

    var output: DetailsVCCollectionDataSourceOutput?

//    MARK: - Protocol methods
    
//    MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifiers.DetailVCCollectionCellName, for: indexPath) as! DetailsCollectionViewCell
        cell.model = itemsArray[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    
//    MARK: DetailsCollectionViewCellDelegate
    
    func detailsCollectionViewCellDelegate(reloadDidTappedFor model: CurrencyItem?) {
        output?.detailsVCCollectionDataSourceOutput(reloadFor: model)
    }
    
}
