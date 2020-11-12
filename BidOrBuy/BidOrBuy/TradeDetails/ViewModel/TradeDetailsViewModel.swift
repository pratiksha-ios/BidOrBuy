//
//  TradeDetailsViewModel.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class TradeDetailsViewModel {
    
    private weak var view: TradeDetailsView?
    private let client = BidOrBuyAPIClient()
    
    init(view: TradeDetailsView) {
        self.view = view
    }

    func setUpViewDetails(_ objTrade: Trade?) {
        self.view?.showLoader()
        if let title = objTrade?.title {
            self.view?.setTradeTitle(title: title)
        }
        if ((objTrade?.images?.count) != nil), let strImagePath = objTrade?.images?.first?.image, let imgUrl = URL(string: strImagePath) {
            self.view?.setTradeIamge(imageUrl: imgUrl)
        }
        if let closeDate = objTrade?.closeTime, let date = Utility.getFormattedDate(string: closeDate) {
            self.view?.setTradeEndDate(endDate: "Ends \(date)")
        }
        self.view?.reloadTableView()
        self.view?.dismissLoader()
    }
    
    func handleActionShare(_ objTrade: Trade?, controller: UIViewController) {
        guard let title = objTrade?.title, ((objTrade?.images?.count) != nil), let strImagePath = objTrade?.images?.first?.image, let imgUrl = URL(string: strImagePath), let closeDate = objTrade?.closeTime, let date = Utility.getFormattedDate(string: closeDate) else {
            return
        }
        let sharedObjects:[AnyObject] = [title as AnyObject, "\n\(imgUrl)\n" as AnyObject, date as AnyObject]
        let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
        controller.present(activityViewController, animated: true)
    }
}
