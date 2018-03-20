//
//  HistoryContract.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol HistoryViewContract {
    func goToHistoryDetail(contactId: Int)
    func show(contactTransfers: [ContactTransferDto])
    func show(graph: [ContactGraphDto])
    func showNoHistory()
    func showErrorDialog()
    
    func showLoader()
    func hideLoader()
}

protocol HistoryPresenterContract {
    func loadContactTransfers()
    func loadGraphDataBy(contactTransfers: [ContactTransferDto])
}
