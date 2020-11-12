//
//  DoubleExtenstions.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation

extension Double {
    
    func convertToDegree() -> String {
        let temp = Int((Double(self) - 273.15))
        return String(temp) + "°"
    }

}
