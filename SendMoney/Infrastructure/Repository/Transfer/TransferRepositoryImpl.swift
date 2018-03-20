//
//  TransferRepositoryImpl.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 19/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class TransferRepositoryImpl: TransferRepository {
    
    private static var INSTANCE: TransferRepositoryImpl?
    
    private let localDataSource: TransferLocalDataSource
    private let remoteDataSource: HistoryRemoteDataSource
    
    private init(localDataSource: TransferLocalDataSource,
                 remoteDataSource: HistoryRemoteDataSource) {
        self.localDataSource  = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    public static func getInstance(localDataSource: TransferLocalDataSource,
                                   remoteDataSource: HistoryRemoteDataSource) -> TransferRepositoryImpl {
        if (INSTANCE == nil) {
            INSTANCE = TransferRepositoryImpl(localDataSource: localDataSource,
                                              remoteDataSource: remoteDataSource)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func all(_ loadCallback: @escaping (BaseCallback<[Transfer]>) -> Void) {
        remoteDataSource.getHistory(token: SendMoneyApplication.getCurrentToken()!) { (remoteCallback) in
            remoteCallback.onSuccess() { (response) in
                //                TODO: IMPLEMENT
//                localDataSource.saveMany(transfers: <#T##[Transfer]#>)
//                loadCallback(BaseCallback.success(<#T##response: _##_#>))
            }
            
            remoteCallback.onFailed() { (error) in
                loadCallback(BaseCallback.failed(error: error))
            }
        }
    }
}
