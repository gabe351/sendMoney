//
//  InjectionUseCase.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionUseCase {
    
    private static let contactsLocalDataSource = InjectionLocalDataSource.provideContactsLocalDataSource()
    
    static func provideGetAuth() -> GetAuth {
        return GetAuth(remoteDataSource: InjectionRemoteDataSource.provideAuthorizationRemoteDataSource())
    }
    
    static func provideSaveSesstionToken() -> SaveSessionToken {
        return SaveSessionToken(localDataSource: InjectionLocalDataSource.provideSessionLocalDataSource())
    }
    
    static func provideSaveContacts() -> SaveContacts {
        return SaveContacts(localDataSource: contactsLocalDataSource)
    }
    
    static func provideGetContacts() -> GetContacts {
        return GetContacts(localDataSource: contactsLocalDataSource)
    }
    
    static func provideSendMoney() -> SendMoney {
        return SendMoney(remoteDataSource: InjectionRemoteDataSource.provideTransferRemoteDataSource())
    }
    
    static func provideGetTransfer() -> GetTransfer {
        return GetTransfer(repository: InjectionRepository.provideHistoryRepository())
    }
}
