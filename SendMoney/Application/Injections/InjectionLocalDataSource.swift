//
//  InjectionLocalDataSource.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import RealmSwift

class InjectionLocalDataSource {
    static let realm = try! Realm()
    
    static func provideSessionLocalDataSource() -> SessionLocalDataSource {
        let userDefaults = UserDefaults.standard
        return SessionLocalDataSourceImpl.getInstance(defaultsDao: userDefaults)
    }
    
    static func provideContactsLocalDataSource() -> ContactsLocalDataSource {
        return ContactsLocalDataSourceImpl.getInstance(realm: realm)
    }
    
    static func provideTransferLocalDataSource() -> TransferLocalDataSource {
        return TransferLocalDataSourceImpl.getInstance(realm: realm)
    }
}
