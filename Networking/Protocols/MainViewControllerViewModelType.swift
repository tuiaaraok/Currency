//
//  MainViewControllerViewModelType.swift
//  Networking
//
//  Created by Айсен Шишигин on 24/01/2021.
//  Copyright © 2021 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol MainViewControllerViewModelType {
    func dateTitle() -> String
    func numberOfRowsInSection() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? 
}
