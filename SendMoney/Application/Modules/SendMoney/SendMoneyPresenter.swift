//
//  SendMoneyPresenter.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class SendMoneyPresenter: SendMoneyPresenterContract {
    
    private let view: SendMoneyViewContract
    private let sendMoney: SendMoney
    
    init(view: SendMoneyViewContract,
         sendMoney: SendMoney) {
        self.view      = view
        self.sendMoney = sendMoney
    }
    
    func sendMoney(transfer: TransferRequest) {
        sendMoney.transfer(parameters: transfer.asBodyParameters()) { (useCaseCallback) in
            
            useCaseCallback.onSuccess() { (response) in
                self.view.hideLoader()
//                TODO - Display success
            }
            
            useCaseCallback.onFailed() { (error) in
                self.view.hideLoader()
//               TODO - Display error
            }
        }
    }
    
}
