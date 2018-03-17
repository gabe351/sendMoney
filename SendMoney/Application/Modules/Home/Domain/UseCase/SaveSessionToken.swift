//
//  SaveSessionToken.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class SaveSessionToken {
    
    private let localDataSource: SessionLocalDataSource
    
    init(localDataSource: SessionLocalDataSource) {
        self.localDataSource = localDataSource
    }
    
    func save(_ token: String) {
        localDataSource.save(token: token)
    }
}
