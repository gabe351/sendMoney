//
//  HomePresenter.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterContract {
    
    private let view: HomeViewContract
    private let getAuth: GetAuth
    private let saveSessionToken: SaveSessionToken
    
    init(view: HomeViewContract, getAuth: GetAuth, saveSessionToken: SaveSessionToken) {
        self.view             = view
        self.getAuth          = getAuth
        self.saveSessionToken = saveSessionToken
    }
    
    func authenticateUser() {
        if SendMoneyApplication.getCurrentToken() != nil {
            self.view.showAuthIconSuccess()
            return
        }
        
        getAuth.authenticate { (useCaseCallback) in
            useCaseCallback.onSuccess() { (token) in
                self.saveSessionToken.save(token as! String)
                self.view.showAuthIconSuccess()
                self.view.hideUnauthorizedLoader()
            }
            
            useCaseCallback.onFailed() { (error) in
                self.view.showAtuhIconError()
            }
        }
    }                
}
