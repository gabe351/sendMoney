//
//  HomeContract.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol HomeViewContract {
    func showAuthIconSuccess()
    func showAtuhIconError()
    
    func showLoader()
    func hideLoader()
    
}

protocol HomePresenterContract {
    func authenticateUser()
}
