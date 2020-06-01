//
//  CoursesViewController.swift
//  Networking
//
//  Created by Alexey Efimov on 21/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CoursesViewController: UITableViewController {
    

    private let jsonUrlhree = "https://www.cbr-xml-daily.ru/daily_json.js"
  

    var money: [Money] = []
    var valutesDict: [String:Opis] = [:]
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataV3()
    }

    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(money.count)
        return valutesDict.count
       
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseCell

     // берем из словаря только значения описания валюты
        let valutes = valutesDict[valutesArray[indexPath.row]]
       
        cell.configure(with: valutes, index: indexPath)
      
        // изменяем тайтл на сокращенную дату
        let date = money[0].date
        let endIndex = date.index(date.endIndex, offsetBy: -15)
        let truncated = date.substring(to: endIndex)
        title = "Данные на \(truncated)"
        
        return cell
    }
    
    // MARK: - TableViewDelegate устанавливаем высоту ячейки
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

  
    @IBAction func getJson(_ sender: Any) {
        postRequest()
    }
    
    
    func fetchDataV3() {
        guard let url = URL(string: jsonUrlhree) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
        guard let data = data else { return }
            
        do {
            // парсим джейсон
            self.money = [try JSONDecoder().decode(Money.self, from: data)]
             
                
            //сохраняем словарь валют и значений в переменную
            self.valutesDict = self.money[0].valute
            DispatchQueue.main.async {
                    self.tableView.reloadData()
            }
            } catch let error {
                print(error)
            }
        }.resume() 
    }
    

}


// создаем функцию для передачи джейсона в сеть
extension CoursesViewController {
    private func postRequest() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        
        let userData = [
            "course" : "Networking",
            "lesson" : "get end post"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        // правила для передачи словаря 
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else {return}
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, _) in
            guard let response = response, let data = data else {return}
            print(response)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options:[])
                print(json)
            }catch let error {
                print(error)
            }
            
        }.resume()
    }
}
