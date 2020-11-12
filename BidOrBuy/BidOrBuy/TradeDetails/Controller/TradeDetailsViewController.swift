//
//  TradeDetailsViewController.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import UIKit
import MBProgressHUD
import AlamofireImage

class TradeTableViewCell : UITableViewCell {
    @IBOutlet weak var lblTradeRate: UILabel!
    @IBOutlet weak var btnBidOrBuy: UIButton!
}

class TradeDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblTradeName: UILabel!
    @IBOutlet weak var imgTradeLogo: UIImageView!
    @IBOutlet weak var lblTradeEnds: UILabel!

    private lazy var viewModel = TradeDetailsViewModel(view: self)
    public var objTradeItem: Trade? = nil
    private let toast = Toast()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Item"
        self.viewModel.setUpViewDetails(objTradeItem)
    }
    
    @IBAction func onBtnShareTapped(sender: UIButton) {
        self.viewModel.handleActionShare(objTradeItem, controller: self)
    }
}

//MARK:- Tableview delegate and datasource
extension TradeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TradeTableViewCell", for: indexPath) as? TradeTableViewCell else {
            return UITableViewCell()
        }
        cell.lblTradeRate.text = "R\(String(format: "%.2f", objTradeItem?.amount ?? 0))"
        return cell
    }
}


extension TradeDetailsViewController: TradeDetailsView {
    func setTradeIamge(imageUrl: URL) {
            let filter = AspectScaledToFillSizeFilter(size: imgTradeLogo?.bounds.size ?? CGSize(width: 240, height: 140))
            self.imgTradeLogo?.af.setImage(
                withURL: imageUrl,
                filter: filter,
                imageTransition: .crossDissolve(0.2)
            )
    }
    
    func setTradeEndDate(endDate: String) {
        self.lblTradeEnds.text = endDate
    }
    
    func setTradeTitle(title: String) {
        self.lblTradeName.text = title
    }
    
    func showLoader() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func dismissLoader() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }

}
