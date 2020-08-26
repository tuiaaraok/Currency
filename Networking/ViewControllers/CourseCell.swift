//
//  CourseCell.swift
//  Networking
//
//  Created by Alexey Efimov on 21/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    @IBOutlet var strelkaImage: UIImageView!
    @IBOutlet var sokrName: UILabel!
    @IBOutlet var nominalLabel: UILabel!
    
    func configure(with course: Description?, index: IndexPath) {
     
        courseNameLabel.text = course?.name
        numberOfLessons.text = "Курс в рублях:   " + String((course?.previous)!)
        numberOfTests.text = "Предыдущий курс:  " + String((course?.value)!)
        sokrName.text = valutesName[index.row]
        nominalLabel.text = "Номинал: \((course?.nominal)!)"
        
        if (course?.previous)! > (course?.value)! {
            strelkaImage.image = #imageLiteral(resourceName: "treugolnik-dlya-samyh-malenkih")
        } else {
            strelkaImage.image = #imageLiteral(resourceName: "2")
        }
    }
}
