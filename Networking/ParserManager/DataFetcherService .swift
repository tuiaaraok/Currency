//
//  ParserManager.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 26/08/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

protocol DataFetcher {
    func fetchData(completion: @escaping ([Currency]) -> Void, urlString: String)
}
class NetworkDataFetcher: NSObject, DataFetcher {
    
    func fetchData(completion: @escaping ([Currency]) -> Void, urlString: String)  {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
        guard let data = data else { return }
            
        do {
            let currencies = [try JSONDecoder().decode(Currency.self, from: data)]
             DispatchQueue.main.async {
                completion(currencies)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
