//
//  ParserManager.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 26/08/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DataFetcherService: NSObject {
    
    var currencies: [Currency]?
    var currenciesDescription: [String:Description]?
    private let url = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    func fetchData(tableView: UITableView?)  {
     
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
        guard let data = data else { return }
            
        do {
            let currencies = [try JSONDecoder().decode(Currency.self, from: data)]

             DispatchQueue.main.async {
                self.currencies = currencies
                self.currenciesDescription = (self.currencies?[0].valute)!
                tableView?.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
