//
//  SendMoneyContract.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol SendMoneyViewContract {
    func showLoader()
    func hideLoader()
}

protocol SendMoneyPresenterContract {
    func sendMoney(transfer: TransferRequest)
}
