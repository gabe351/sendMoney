//
//  TransferEntry.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class TransferEntry: Entry {
    
    @objc dynamic var guid     = ""
    @objc dynamic var id       = Int()
    @objc dynamic var clientId = Int()
    @objc dynamic var value    = Float()
    @objc dynamic var token    = ""
    @objc dynamic var date     = Date(timeIntervalSince1970: 1)
    
    override static func primaryKey() -> String? {
        return "guid"
    }
    
}
