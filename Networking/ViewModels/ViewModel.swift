//
//  ViewModel.swift
//  Networking
//
//  Created by Айсен Шишигин on 21/09/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class ViewModel: NSObject, MainViewControllerViewModelType {
    
    @IBOutlet weak var  dataFetcherService: NetworkDataFetcher!
    
    var workWithString: WorkWithString!
    var currencies: [Currency]?
    var currenciesDescription: [String:Description]?
    var networkService = NetworkService()
    
     var currencyNames = ["AUD", "AZN", "GBP", "AMD", "BYN", "BGN", "BRL", "HUF", "HKD", "DKK", "USD", "EUR", "INR", "KZT", "CAD", "KGS", "CNY", "MDL", "NOK", "PLN", "RON", "XDR", "SGD", "TJS", "TRY", "TMT", "UZS", "UAH", "CZK", "SEK", "CHF", "ZAR", "KRW", "JPY"]
    
    func getData() {
        networkService.fetchCurrency { (currencies) in
            self.currencies = currencies
            self.currenciesDescription = currencies[0].valute
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload"), object: nil)
        }
    }
    
    func dateTitle() -> String {
        workWithString = WorkWithString()
        let date = workWithString.deleteLastChracters(in: currencies?[0].date)
        return "Данные на \(date)"
    }
    func numberOfRowsInSection() -> Int {
        return currencyNames.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        guard let valutes = currenciesDescription?[currencyNames[indexPath.row]] else { return nil }
        return TableViewCellViewModel(description: valutes,
                                      abbreviatedName: currencyNames[indexPath.row])
    }
}
