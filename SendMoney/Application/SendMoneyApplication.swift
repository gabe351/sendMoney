//
//  SendMoneyApplication.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class SendMoneyApplication {
    
    static func getCurrentToken() -> String? {
        return InjectionLocalDataSource.provideSessionLocalDataSource().getTokenBy(key: SessionLocalDataSourceImpl.PREFERENCE_KEY)
    }
    
    static func destroyToken() {
        InjectionLocalDataSource.provideSessionLocalDataSource().destroyBy(key: SessionLocalDataSourceImpl.PREFERENCE_KEY)
    }
}
