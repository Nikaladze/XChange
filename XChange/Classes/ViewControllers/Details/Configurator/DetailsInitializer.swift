//
//  DetailsDetailsInitializer.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class DetailsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var detailsViewController: DetailsViewController!

    override func awakeFromNib() {

        let configurator = DetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: detailsViewController)
    }

}
