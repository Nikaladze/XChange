//
//  DetailsDetailsViewController.swift
//  XChange
//
//  Created by Nick Voloshyn on 26/08/2017.
//  Copyright © 2017 Bridge 777. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, DetailsViewInput, DetailsVCCollectionDataSourceOutput {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var output: DetailsViewOutput!
    var items: Array<CurrencyItem> = []
    var selectedIndex: Int = 0
    
    private var dataSource: DetailsVCCollectionDataSource?
    private var delegate: DetailsVCCollectionViewDelegate?

    
//  MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady(forCurrencies: items)
        
        collectionView.scrollToItem(at: IndexPath(item: selectedIndex, section: 0), at: .centeredHorizontally, animated: false)
    }
    
    
    override func awakeFromNib() {
        let configurator = DetailsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }


//    MARK: - Protocol methods
    
//  MARK: DetailsViewInput
    
    func setupInitialState(withCurrencies items: Array<DetailItem>) {
        dataSource = DetailsVCCollectionDataSource()
        dataSource?.itemsArray = items
        collectionView.dataSource = dataSource
        delegate = DetailsVCCollectionViewDelegate()
        collectionView.delegate = delegate
        dataSource?.output = self
    }
    
    
    func detailsViewInput(updated items: Array<CurrencyItem>, forCurrency model: CurrencyItem) {
        var index = 0
        for item in dataSource?.itemsArray ?? [] {
            if item.curencyItem?.code == model.code {
                
//                Я не стал заморачиваться с начальной сортировкой;
//                по-хорошему, этой задачей должен заниматься Presenter
//                но мне лениво было добавлять еще код
                dataSource?.itemsArray[index].rates = items
                break
            }
            index += 1
        }
        collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
    }
    
    
//    MARK: DetailsVCCollectionDataSourceOutput
    
    func detailsVCCollectionDataSourceOutput(reloadFor model: CurrencyItem?) {
        output.detailsViewOutput(updateDataForCurrency: model)
    }
    
    
}
