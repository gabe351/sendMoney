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
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        
        let index = dateStr?.index((dateStr?.startIndex)!, offsetBy: 10)
        
        if let date = dateStr {
            return dateFormatter.date(from: (dateStr?.substring(to: index!))!)
        }
        
        return nil
    }
    
    public static func buildDateOnBrazilianFormat(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: date)
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
