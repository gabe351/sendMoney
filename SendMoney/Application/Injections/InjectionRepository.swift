//
//  InjectionRepository.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 19/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class InjectionRepository {
    
    static func provideHistoryRepository() -> TransferRepository {
        return TransferRepositoryImpl.getInstance(localDataSource: InjectionLocalDataSource.provideTransferLocalDataSource(),
                                                  remoteDataSource: InjectionRemoteDataSource.provideHistoryRemoteDataSource())
    }
    
}
