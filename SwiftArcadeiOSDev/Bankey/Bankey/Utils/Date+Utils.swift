//
//  Date+Utils.swift
//  Bankey
//
//  Created by Marcos Avila Rodriguez on 21/02/22.
//

import Foundation


extension Date {
    static var bankeyDateFormatter: DateFormatter {
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(abbreviation: "MDT")
        return formatter
        
    }
    
    var monthDayYearString: String {
        
        let dateFormatter = Date.bankeyDateFormatter
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: self)
        
    }
}
