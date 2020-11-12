//
//  Utility.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

class Utility {
            
    static func getFormattedDate(string: String) -> String?{
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM HH:MM"
        guard let date = serverToLocal(date: string) else {
            return nil
        }
        let strDate = dateFormatterPrint.string(from: date)
        return strDate
    }
    
    static func serverToLocal(date:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        let localDate = dateFormatter.date(from: date)

        return localDate
    }
}
