//
//  TransferRemoteDataSourceImpl.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Alamofire

class TransferRemoteDataSourceImpl: TransferRemoteDataSource {
    
    func sendTransfer(parameters: Parameters, _ loadCallback: @escaping (BaseCallback<Any>) -> Void) {
        ApiDataSource.simpleRequest(url: RemoteUtils.buildUrl(path: "SendMoney"), parameters: parameters, method: .post) { (callback) in
            callback.onSuccess() { (wasSendResponse) in
                loadCallback(BaseCallback.success(wasSendResponse))
            }
            
            callback.onFailed() { (error) in
                loadCallback(BaseCallback.failed(error: error))
            }
        }
    }
}
