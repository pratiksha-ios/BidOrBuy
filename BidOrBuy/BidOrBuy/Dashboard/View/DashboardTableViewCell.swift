//
//  DashboardTableViewCell.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/12.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class DashboardTableViewCell : UITableViewCell {
    
    @IBOutlet weak var lblTradeName: UILabel!
    @IBOutlet weak var imgTradeLogo: UIImageView!
    @IBOutlet weak var lblTradeRate: UILabel!
    @IBOutlet weak var lblTradeEnds: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateUI(trade: Trade) {
        self.lblTradeName.text = trade.title
        self.lblTradeRate.text = "R\(String(format: "%.2f", trade.amount ?? 0))"
        if let closeDate = trade.closeTime, let date = Utility.getFormattedDate(string: closeDate) {
            self.lblTradeEnds.text = "Ends \(date)"
        }
        if ((trade.images?.count) != nil), let strImagePath = trade.images?.first?.image, let imgUrl = URL(string: strImagePath) {
            let filter = AspectScaledToFillSizeFilter(size: imgTradeLogo?.bounds.size ?? CGSize(width: 100, height: 100))
            self.imgTradeLogo?.af.setImage(
                withURL: imgUrl,
                filter: filter,
                imageTransition: .crossDissolve(0.2)
            )
        }
    }
}
