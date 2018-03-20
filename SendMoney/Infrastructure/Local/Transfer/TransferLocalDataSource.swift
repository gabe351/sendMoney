//
//  TransferLocalDataSource.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol TransferLocalDataSource {
    
    func saveMany(transfers: [Transfer]) -> [Transfer]?
    
    func all() -> [Transfer]
    
    func findValueBy(contactId: Int) -> Float
    
    func allTransferBy(contactId: Int) -> [Transfer]
    
    func destroyAll()
}
