//
//  GetAuth.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GetAuth {
    
    private let remoteDataSource: AuthenticateRemoteDataSource
    
    init(remoteDataSource: AuthenticateRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func authenticate(_ loadCallback: @escaping (BaseCallback<Any>) -> Void) {
        remoteDataSource.authencticate(loadCallback)
    }
}
