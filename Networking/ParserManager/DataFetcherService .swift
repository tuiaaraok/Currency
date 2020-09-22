//
//  ParserManager.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 26/08/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DataFetcherService: NSObject {
    
    var money: [Money]?
    var valutesDict: [String:Description]?
    private let url = "https://www.cbr-xml-daily.ru/daily_json.js"
    
    func fetchData()  {
     
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
        guard let data = data else { return }
            
        do {
            let money = [try JSONDecoder().decode(Money.self, from: data)]

             DispatchQueue.main.async {
                self.money = money 
                self.valutesDict = (self.money?[0].valute)!
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
