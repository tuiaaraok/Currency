//
//  TableViewCellViewModel.swift
//  Networking
//
//  Created by Айсен Шишигин on 22/09/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var description: Description
    
    var courseName: String {
        return String(description.nominal) + " " + description.name
    }
    
    var courseInRub: String {
        let x = Double(round(10000*description.value)/10000)
        return String(x) + "P"
    }
    
    var lastCourseInRub: String {
        let difference = description.value - description.previous
        let y = Double(round(10000*difference)/10000)
        
        if difference > 0 {
            return "+ \(y)"
        } else if difference == 0 {
             return "0"
        } else {
            return String(y)
        }
    }
    
    var abbreviatedName: String
    var increase: Bool {
        description.value > description.previous
    }
    
    init(description: Description, abbreviatedName: String) {
        self.description = description
        self.abbreviatedName = abbreviatedName
    }
}
