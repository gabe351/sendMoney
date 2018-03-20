//
//  GetContacts.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GetContacts {
    
    private let localDataSource: ContactsLocalDataSource
    
    init(localDataSource: ContactsLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func all() -> [Contact] {
        return localDataSource.all()
    }
    
    func findBy(id: Int) -> Contact {
        return localDataSource.findBy(id: id)
    }
}
