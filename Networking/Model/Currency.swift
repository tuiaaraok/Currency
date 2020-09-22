//
//  Course.swift
//  Networking
//
//  Created by Туйаара Оконешникова on 26/08/2020.
//  Copyright © 2020 Туйаара Оконешникова. All rights reserved.
//

struct Currency: Decodable {
    let date: String
    let valute: [String : Description]
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case valute = "Valute"
    }
}

struct Description: Decodable {
    let nominal: Int
    let name: String
    let value: Double
    let previous: Double

    enum CodingKeys: String, CodingKey {
        case nominal = "Nominal"
        case name = "Name"
        case value = "Value"
        case previous = "Previous"
    }
}
