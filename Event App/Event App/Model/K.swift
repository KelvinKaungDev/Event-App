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
}
