//
//  DetailsDetailsConfigurator.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class DetailsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DetailsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DetailsViewController) {

        let router = DetailsRouter()

        let presenter = DetailsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DetailsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
