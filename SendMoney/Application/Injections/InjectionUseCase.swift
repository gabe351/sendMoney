//
//  InjectionUseCase.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionUseCase {
    
    static func provideGetAuth() -> GetAuth {
        return GetAuth(remoteDataSource: InjectionRemoteDataSource.provideAuthorizationRemoteDataSource())
    }
    
    static func provideSaveSesstionToken() -> SaveSessionToken {
        return SaveSessionToken(localDataSource: InjectionLocalDataSource.provideSessionLocalDataSource())
    }
}
