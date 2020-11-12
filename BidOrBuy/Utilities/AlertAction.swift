//
//  AlertAction.swift
//  BidOrBuy
//
//  Created by Pratiksha on 2020/11/11.
//  Copyright © 2020 Pratiksha. All rights reserved.
//

import Foundation

struct AlertAction {
    let buttonTitle: String
    let handler: (() -> Void)?
}

struct SingleButtonAlert {
    let title: String
    let message: String?
    let action: AlertAction
}
