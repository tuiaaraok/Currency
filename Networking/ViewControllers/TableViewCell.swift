//
//  CourseCell.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 03/03/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    @IBOutlet var strelkaImage: UIImageView!
    @IBOutlet var sokrName: UILabel!
    @IBOutlet var nominalLabel: UILabel!
    
    func configure(with description: Description?, _ indexPath: IndexPath) {
        let mainVC = MainViewController()
     
        courseNameLabel.text = description?.name
        numberOfLessons.text = "Курс в рублях:   " + String((description?.previous)!)
        numberOfTests.text = "Предыдущий курс:  " + String((description?.value)!)
        sokrName.text = mainVC.valutesName[indexPath.row]
        nominalLabel.text = "Номинал: \((description?.nominal)!)"
        
        if (description?.previous)! > (description?.value)! {
            strelkaImage.image = #imageLiteral(resourceName: "treugolnik-dlya-samyh-malenkih")
        } else {
            strelkaImage.image = #imageLiteral(resourceName: "2")
        }
    }
}
