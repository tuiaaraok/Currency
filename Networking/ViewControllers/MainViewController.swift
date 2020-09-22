//
//  CoursesViewController.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 03/03/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    @IBOutlet var viewModel: ViewModel!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.dataFetcherService.fetchData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection() ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        guard let viewModel = viewModel else { return TableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cell.viewModel = cellViewModel
        title = viewModel.dateTitle()
        
        return cell
    }
    
    // MARK: - TableViewDelegate устанавливаем высоту ячейки
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

