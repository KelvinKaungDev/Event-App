//
//  K.swift
//  Event App
//
//  Created by Austin Xu on 2024/2/1.
//

import Foundation

struct K{
    static func dateformatter (date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
    
    static func timeformatter(date: Date)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h a"
        return dateFormatter.string(from: date)
    }
    
    static func stringToDate(from: String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: from)!
        return date
    }
}
