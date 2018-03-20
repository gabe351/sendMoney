//
//  HistoryDetailContract.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 20/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol HistoryDetailViewContract {
    func show(history: HistoryDto)
}

protocol HistoryDetailPresenterContract {
    func loadHistoryBy(contactId: Int)
}
