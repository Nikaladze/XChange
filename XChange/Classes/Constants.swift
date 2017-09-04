//
//  Constants.swift
//  dreams
//
//  Created by Nick Voloshyn on 6/19/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class Constants: NSObject {

//    MARK: Structs
    
    struct SegueNames {
        static let ShowDetailsVCSegueName: String = "ShowDetailsVCSegue"
    }
    
    
    struct CellIdentifiers {
        static let HomeTableViewCellName: String = "HomeTableViewCell"
        static let DetailVCCollectionCellName: String = "DetailVCCollectionCell"
        static let DetailsTableViewCellName: String = "DetailsTableViewCell"
    }
    
    
    struct Enteties {
        static let Currency: String = "Currency"
    }
    
    
//    MARK: Functions
    
    class func ApplicationDelegate() -> AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    
    class func roundView(for view:UIView, withRadius rValue: CGFloat) {
        view.layer.cornerRadius = rValue
    }
    
    
}
