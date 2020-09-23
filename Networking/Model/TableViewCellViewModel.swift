//
//  TableViewCellViewModel.swift
//  Networking
//
//  Created by Айсен Шишигин on 22/09/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class TableViewCellViewModel: TableViewCellViewModelType {
    
    private var description: Description
    
    var courseName: String {
        return String(description.nominal) + " " + description.name
    }
    
    var courseInRub: String {
        return String(description.value) + "P"
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
    
    var strelkaImage: UIImage {
        if description.value > description.previous {
            return #imageLiteral(resourceName: "treugolnik-dlya-samyh-malenkih")
               } else {
            return #imageLiteral(resourceName: "2")
               }
    }
    
    init(description: Description, abbreviatedName: String) {
        self.description = description
        self.abbreviatedName = abbreviatedName
    }
}
