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
    
    func totalValueBy(contactId: Int) -> Float {
        return localDataSource.findValueBy(contactId: contactId)
    }
    
    func allTransferBy(contactId: Int) -> [Transfer] {
        return localDataSource.allTransferBy(contactId: contactId)
    }
    
    func all(_ loadCallback: @escaping (BaseCallback<[Transfer]>) -> Void) {
        remoteDataSource.getHistory(token: SendMoneyApplication.getCurrentToken()!) { (remoteCallback) in
            remoteCallback.onSuccess() { (transfers) in
                
                if transfers.isEmpty {
                    loadCallback(BaseCallback.emptyData())
                } else {
                    self.localDataSource.destroyAll()
                    let _ = self.localDataSource.saveMany(transfers: transfers)
                    loadCallback(BaseCallback.success(transfers))
                }
            }
            
            remoteCallback.onFailed() { (error) in
                loadCallback(BaseCallback.failed(error: error))
            }
        }
    }
}
