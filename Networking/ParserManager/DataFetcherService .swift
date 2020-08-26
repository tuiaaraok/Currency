//
//  ParserManager.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 26/08/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class DataFetcherService {
    
    func fetchData<T: Decodable>(url: String, completion: @escaping ([T]) -> ())  {
     
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
        guard let data = data else { return }
            
        do {
            let money = [try JSONDecoder().decode(T.self, from: data)]
            completion(money)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
