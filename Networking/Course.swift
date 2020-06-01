//
//  Course.swift
//  Networking
//
//  Created by Alexey Efimov on 21/08/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//



struct Money: Decodable {
    let date: String
    let valute: [String : Opis]
    
    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case valute = "Valute"
    }
}



struct Opis: Decodable {
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


var valutesArray = ["AUD", "AZN", "GBP", "AMD", "BYN", "BGN", "BRL", "HUF", "HKD", "DKK", "USD", "EUR", "INR", "KZT", "CAD", "KGS", "CNY", "MDL", "NOK", "PLN", "RON", "XDR", "SGD", "TJS", "TRY", "TMT", "UZS", "UAH", "CZK", "SEK", "CHF", "ZAR", "KRW", "JPY"]
   
