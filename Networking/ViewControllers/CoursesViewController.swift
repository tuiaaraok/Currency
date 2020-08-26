//
//  CoursesViewController.swift
//  Networking
//
//  Created by Alexey Efimov on 21/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CoursesViewController: UITableViewController {

    private let url = "https://www.cbr-xml-daily.ru/daily_json.js"

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseCell
        let valutes = valutesDict[valutesName[indexPath.row]]
        cell.configure(with: valutes, index: indexPath)

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

