//
//  HistoryRemoteDataSourceImpl.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class HistoryRemoteDataSourceImpl: HistoryRemoteDataSource {
    
    func getHistory(token: String, _ loadCallback: @escaping (BaseCallback<Any>) -> Void) {
        ApiDataSource.simpleRequest(url: RemoteUtils.buildUrl(path: "GetTransfers"),
                                    parameters: RemoteUtils.buildHistoryParameters(token: token), method: .get) { (callback) in
            callback.onSuccess() { (response) in
//                MAP RESPONSE TO JSON
                loadCallback(BaseCallback.success(response))
            }
            
            callback.onFailed() { (error) in
                loadCallback(BaseCallback.failed(error: error))
            }
        }
    }
}
