//
//  TableViewCellViewModelType.swift
//  Networking
//
//  Created by Айсен Шишигин on 22/09/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

protocol TableViewCellViewModelType {
    
    var courseName: String { get }
    var courseInRub: String { get }
    var lastCourseInRub: String { get }
    var increase: Bool { get }
    var abbreviatedName: String { get }
}
