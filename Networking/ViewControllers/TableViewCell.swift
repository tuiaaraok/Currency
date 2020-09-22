//
//  CourseCell.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 03/03/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var courseInRub: UILabel!
    @IBOutlet var lastCourseInRub: UILabel!
    @IBOutlet var strelkaImage: UIImageView!
    
    var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }

            courseNameLabel.text = viewModel.courseName
            courseInRub.text = viewModel.courseInRub
            lastCourseInRub.text = viewModel.lastCourseInRub
            strelkaImage.image = viewModel.strelkaImage
        }
    }
}
