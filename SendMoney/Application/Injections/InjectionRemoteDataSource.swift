//
//  InjectionRemoteDataSource.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionRemoteDataSource {
    
    static func provideAuthorizationRemoteDataSource() -> AuthenticateRemoteDataSource {
        return AuthenticateRemoteDataSourceImpl()
    }
    
}
