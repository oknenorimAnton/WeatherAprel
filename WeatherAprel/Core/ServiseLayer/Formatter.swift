//
//  Formatter.swift
//  WeatherAprel
//
//  Created by Антон on 21.05.2023.
//

import Foundation

final class Formatter {
    static func format(dateString: String, dateFormat: DateFormat) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.date(from: dateString)
    }
    
    static func format(date: Date?, dateFormat: DateFormat) -> String? {
        guard let date else {
            return nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: date)
    }
}

enum DateFormat: String {
    case yyyymmdd = "yyyy-MM-dd"
    case ddMMMM = "dd MMMM"
    case unix = "yyyy-MM-dd HH:mm:ss Z"
}
