//
//  TradeDetailsView.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation
import UIKit

protocol TradeDetailsView: AnyObject {
    func showLoader()
    func dismissLoader()
    func reloadTableView()
    func setTradeIamge(imageUrl: URL)
    func setTradeEndDate(endDate: String)
    func setTradeTitle(title: String)
}
