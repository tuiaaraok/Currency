//
//  ViewModel.swift
//  Networking
//
//  Created by Айсен Шишигин on 21/09/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    @IBOutlet weak var  dataFetcherService: DataFetcherService!
    
    var workWithString: WorkWithString!
    
     var currencyNames = ["AUD", "AZN", "GBP", "AMD", "BYN", "BGN", "BRL", "HUF", "HKD", "DKK", "USD", "EUR", "INR", "KZT", "CAD", "KGS", "CNY", "MDL", "NOK", "PLN", "RON", "XDR", "SGD", "TJS", "TRY", "TMT", "UZS", "UAH", "CZK", "SEK", "CHF", "ZAR", "KRW", "JPY"]
    
    func numberOfRowsInSection() -> Int {
        return currencyNames.count
    }
    
    func dateTitle() -> String {
        workWithString = WorkWithString()
        let date = workWithString.deleteLastChracters(in: dataFetcherService.currencies?[0].date)
        return "Данные на \(date)"
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        dataFetcherService.fetchData(tableView: nil)
        guard let valutes = dataFetcherService.currenciesDescription?[currencyNames[indexPath.row]] else { return nil }
        
        return TableViewCellViewModel(description: valutes,
                                      abbreviatedName: currencyNames[indexPath.row])
    }
}
