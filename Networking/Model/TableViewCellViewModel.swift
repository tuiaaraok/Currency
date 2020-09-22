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
        return String(description.previous) + "P"
    }
    
    var lastCourseInRub: String {
        return "Предыдущий курс:  " + String(description.value)
    }
    
    var strelkaImage: UIImage {
        if description.previous > description.value {
            return #imageLiteral(resourceName: "treugolnik-dlya-samyh-malenkih")
               } else {
            return #imageLiteral(resourceName: "2")
               }
    }
    
    init(description: Description) {
        self.description = description
    }
}
