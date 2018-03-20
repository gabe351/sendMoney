//
//  HistoryRemoteDataSourceImpl.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Alamofire

class HistoryRemoteDataSourceImpl: HistoryRemoteDataSource {
            
    func getHistory(token: String, _ loadCallback: @escaping (BaseCallback<[Transfer]>) -> Void) {
        ApiDataSource.requestTransfers(url: RemoteUtils.buildUrl(path: "GetTransfers"),
                                       parameters: RemoteUtils.buildHistoryParameters(token: token),
                                       method: .get) { (callback) in
            callback.onSuccess() { (response) in
                
                
//                loadCallback(BaseCallback.success(response))
            }
            
            callback.onFailed() { (error) in
                loadCallback(BaseCallback.failed(error: error))
            }
        }
    }
}
