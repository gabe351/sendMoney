//
//  HomeCustomAlertDelegate.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

extension HomeViewController: CustomAlertDelegate {    
    func buttonDidPressed() {
        presenter.authenticateUser()
    }
}
