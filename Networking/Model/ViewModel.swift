//
//  ViewModel.swift
//  Networking
//
//  Created by Айсен Шишигин on 21/09/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class ViewModel: DataFetcherService {
    
    @IBOutlet weak var  dataFetcherService: DataFetcherService!
    
     var valutesName = ["AUD", "AZN", "GBP", "AMD", "BYN", "BGN", "BRL", "HUF", "HKD", "DKK", "USD", "EUR", "INR", "KZT", "CAD", "KGS", "CNY", "MDL", "NOK", "PLN", "RON", "XDR", "SGD", "TJS", "TRY", "TMT", "UZS", "UAH", "CZK", "SEK", "CHF", "ZAR", "KRW", "JPY"]
    
    func numberOfRowsInSection() -> Int {
        return valutesName.count
    }
    
    func dateTitle() -> String {
        guard let dateText = money?[0].date else { return "" }
        let endIndex = dateText.index(dateText.endIndex , offsetBy: -15)
        let newStr = String(dateText[..<endIndex])
        print(newStr)
        return "Данные на \(newStr)"
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        fetchData()
        guard let valutes = valutesDict?[valutesName[indexPath.row]] else { return nil }
        
        return TableViewCellViewModel(description: valutes)
    }
}
