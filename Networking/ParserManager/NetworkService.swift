//
//  NetworkService.swift
//  Networking
//
//  Created by Айсен Шишигин on 24/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class NetworkService {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchCurrency(completion: @escaping ([Currency]) -> Void) {
        let urlString = "https://www.cbr-xml-daily.ru/daily_json.js"
        dataFetcher.fetchData(completion: completion, urlString: urlString)
    }
}
