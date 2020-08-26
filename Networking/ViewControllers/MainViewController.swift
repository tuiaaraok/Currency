//
//  CoursesViewController.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 03/03/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    private let url = "https://www.cbr-xml-daily.ru/daily_json.js"
    var valutesName = ["AUD", "AZN", "GBP", "AMD", "BYN", "BGN", "BRL", "HUF", "HKD", "DKK", "USD", "EUR", "INR", "KZT", "CAD", "KGS", "CNY", "MDL", "NOK", "PLN", "RON", "XDR", "SGD", "TJS", "TRY", "TMT", "UZS", "UAH", "CZK", "SEK", "CHF", "ZAR", "KRW", "JPY"]

    var money: [Money] = []
    var valutesDict: [String:Description] = [:]
    let dataFetcherService = DataFetcherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataFetcherService.fetchData(url: url, completion: fetch(money:))
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valutesDict.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let valutes = valutesDict[valutesName[indexPath.row]]
        cell.configure(with: valutes, indexPath)

        let dateText = money[0].date
        let endIndex = dateText.index(dateText.endIndex , offsetBy: -15)
        let newStr = String(dateText[..<endIndex])
        title = "Данные на \(newStr)"
        
        return cell
    }
    
    // MARK: - TableViewDelegate устанавливаем высоту ячейки
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
  
    private func fetch(money: [Money]) -> Void {
        self.money = money
        DispatchQueue.main.async {
            self.valutesDict = self.money[0].valute
            self.tableView.reloadData()
        }
    }
}

