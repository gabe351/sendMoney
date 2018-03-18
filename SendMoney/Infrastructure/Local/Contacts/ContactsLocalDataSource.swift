//
//  ContactsLocalDataSource.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ContactsLocalDataSource {
    
    func saveMany(contacts: [Contact]) -> [Contact]?
    
    func all() -> [Contact]
    
    func findBy(id: Int) -> Contact
    
    func destroyMany(ids: [Int])
    
}
