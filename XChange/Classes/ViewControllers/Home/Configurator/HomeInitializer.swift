//
//  HomeHomeInitializer.swift
//  XChange
//
//  Created by Nick Voloshyn on 25/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class HomeModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var homeViewController: HomeViewController!

    override func awakeFromNib() {

        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: homeViewController)
    }

}
