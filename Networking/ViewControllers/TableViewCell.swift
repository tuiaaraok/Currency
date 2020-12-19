//
//  CourseCell.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 03/03/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet private var courseNameLabel: UILabel!
    @IBOutlet private var courseInRub: UILabel!
    @IBOutlet private var lastCourseInRub: UILabel!
    @IBOutlet private var strelkaImage: UIImageView!
    @IBOutlet private weak var abbreviatedNameLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView! {
        willSet(activityIndicator) {
            activityIndicator.startAnimating()
            activityIndicator.hidesWhenStopped = true
        }
    }
    
    var viewModel: TableViewCellViewModelType? {
      
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            
            courseNameLabel.text = viewModel.courseName
            courseInRub.text = viewModel.courseInRub
            lastCourseInRub.text = viewModel.lastCourseInRub
            strelkaImage.image = viewModel.strelkaImage
            abbreviatedNameLabel.text = viewModel.abbreviatedName
            activityIndicator.stopAnimating()
        }
    }
}
