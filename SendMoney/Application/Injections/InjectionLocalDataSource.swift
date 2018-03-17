//
//  InjectionLocalDataSource.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionLocalDataSource {
    
    static func provideSessionLocalDataSource() -> SessionLocalDataSource {
        let userDefaults = UserDefaults.standard
        return SessionLocalDataSourceImpl.getInstance(defaultsDao: userDefaults)
    }    
}
