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
    
    func sendMoney(clientId: Int, value: Float) {
        view.showLoader()
        let transfer = Transfer(id: Int(arc4random_uniform(1000000)),
                                clientId: clientId,
                                walletValue: value,
                                token: SendMoneyApplication.getCurrentToken()!,
                                date: DateConverter.fromIso8601(date: Date())!)
        
        sendMoney.transfer(parameters: transfer.asBodyParameters()) { (useCaseCallback) in
            
            useCaseCallback.onSuccess() { (response) in
                self.view.hideLoader()
                self.view.showSuccess()
            }
            
            useCaseCallback.onFailed() { (error) in
                self.view.hideLoader()
                //               TODO - Display error
            }
        }
    }
}
