//
//  WorkWithString.swift
//  Networking
//
//  Created by Айсен Шишигин on 19/12/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

import Foundation

class WorkWithString {
    
    func deleteLastChracters(in dateString: String?) -> String {
        guard let dateText = dateString else { return "" }
        let endIndex = dateText.index(dateText.endIndex , offsetBy: -15)
        let newStr = String(dateText[..<endIndex])
        
        return addSpaces(between: newStr)
    }
    
    private func addSpaces(between dateString: String) -> String {
        var word = ""
        for i in dateString {
            if i == "-" {
                word += "."
            } else {
                word += "\(i)"
            }
        }
        return word
    }
}
