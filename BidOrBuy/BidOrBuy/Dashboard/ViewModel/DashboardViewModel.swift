//
//  DashboardViewModel.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation
import CoreLocation

class DashboardViewModel {
    
    private weak var view: DashboardView?
    private let client = BidOrBuyAPIClient()
    
    init(view: DashboardView) {
        self.view = view
    }
    
    func fetchTradeSearchAPICall(_ searchText: String) {
        self.view?.showLoader()
        client.getTradeDetails(searchText: searchText) { [weak self] result, error in
            self?.view?.dismissLoader()
            if let error = error {
                self?.view?.showToast(message: error.localizedDescription)
            }
            guard let result = result else { return }
            self?.view?.updateTradeSearchData(result: result)
        }
    }
    
    func checkInternetConnectivity(_ searchText: String) {
        if !Reachability.isConnectedToNetwork() {
            view?.showToast(message:  "internet.unavailable.message".localized())
        }else {
            self.fetchTradeSearchAPICall(searchText)
        }
    }
}
