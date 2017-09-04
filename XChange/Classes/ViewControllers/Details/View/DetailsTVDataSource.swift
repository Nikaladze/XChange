//
//  DetailsTVDataSource.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/26/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class DetailsTVDataSource: NSObject, UITableViewDataSource {
    
    
    var itemsArray: Array<CurrencyItem> = []
    
    
//    MARK: - Protocol methods
    
//    MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.DetailsTableViewCellName, for: indexPath) as! DetailsCollectionTableViewCell
        cell.model = itemsArray[indexPath.row]
        return cell
    }
    
}
