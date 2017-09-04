//
//  AboutViewController.swift
//  XChange
//
//  Created by Nick Voloshyn on 8/27/17.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

//    MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
//    MARK: - Action methods
    
    @IBAction func closeButtonDidTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func callButtonDidTapped(_ sender: Any) {
        if let phoneCallURL = URL(string: "tel://0665010166") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }

}
