//
//  HomeHomeViewController.swift
//  XChange
//
//  Created by Nick Voloshyn on 25/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class HomeViewController: RootViewController, HomeViewInput, UITableViewDelegate {

    @IBOutlet weak var additionalTableView: UITableView!
    @IBOutlet weak var mainTableView: UITableView!
    
    var output: HomeViewOutput!
    
    private var additionalTVDataSource: HomeVCTableViewDataSource?
    private var mainTVDataSource: HomeVCTableViewDataSource?

    
//    MARK: - Life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        additionalTVDataSource = HomeVCTableViewDataSource()
        mainTVDataSource = HomeVCTableViewDataSource()
    }
    
    
    override func awakeFromNib() {
        let configurator = HomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    
//    MARK: - Action methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.SegueNames.ShowDetailsVCSegueName {
            let destinationVC = segue.destination as! DetailsViewController
            
//            Я передаю items чтобы сохранить изначальную сортировку с первого экрана
//            т.к. там была задача с сортировкой которую я не понял :)
            destinationVC.items = (additionalTVDataSource?.itemsArray)! + (mainTVDataSource?.itemsArray)!
            var selectedIndex = 0
            if let selectedRow = additionalTableView.indexPathForSelectedRow?.row {
                selectedIndex = selectedRow
            } else if let selectedRow = mainTableView.indexPathForSelectedRow?.row {
                selectedIndex = selectedRow + (additionalTVDataSource?.itemsArray.count)!
            }
            destinationVC.selectedIndex = selectedIndex
        }
    }
    

//    MARK: - Protocol methods
    
//    MARK: HomeViewInput
    
    func setupInitialState(forCurrencies items: Array<CurrencyItem>) {
        additionalTVDataSource?.itemsArray = items.filter( {$0.code == "USD" || $0.code == "EUR" || $0.code == "RUB"} )
        additionalTableView.dataSource = additionalTVDataSource
        additionalTableView.delegate = self
        additionalTableView.reloadData()
        
        mainTVDataSource?.itemsArray = items.filter( {$0.code != "USD" && $0.code != "EUR" && $0.code != "RUB"} ).sorted( by: { $0.code! < $1.code! })
        mainTableView.dataSource = mainTVDataSource
        mainTableView.delegate = self
        mainTableView.reloadData()
    }
    
    
//    MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if let selectedRow = additionalTableView.indexPathForSelectedRow {
            additionalTableView.deselectRow(at: selectedRow, animated: false)
        } else if let selectedRow = mainTableView.indexPathForSelectedRow {
            mainTableView.deselectRow(at: selectedRow, animated: false)
        }
        return indexPath
    }
    
    
    
}
