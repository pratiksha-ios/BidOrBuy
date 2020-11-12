//
//  DashboardView.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation
import UIKit

protocol DashboardView: AnyObject {
    func showLoader()
    func dismissLoader()
    func reloadTableView()
    func updateTradeSearchData(result: TradeSearch)
    func showToast(message: String)
    func navigateToTradeDetails(data: Trade)
}
