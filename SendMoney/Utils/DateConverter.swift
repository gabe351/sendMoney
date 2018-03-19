//
//  DateConverter.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class DateConverter {
    
    public static func fromIso8601(dateStr: String?) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        
        if let date = dateStr {
            return dateFormatter.date(from: date)
        }
        
        return nil
    }
    
    public static func fromIso8601(date: Date?) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        
        if let d = date {
            return dateFormatter.string(from: d)
        }
        
        return ""
    }
}
