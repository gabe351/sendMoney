//
//  AuthenticationRemoteDataSource.swift
//  SendMoney
//
//  Created by Stant 02 on 16/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Alamofire

class AuthenticateRemoteDataSourceImpl: AuthenticateRemoteDataSource {
    
    func authencticate(_ loadCallback: @escaping (BaseCallback<Any>) -> Void) {
        
        ApiDataSource.simpleRequest(url: RemoteUtils.buildUrl(path: "GenerateToken"), parameters: RemoteUtils.buildAuthParameters(), method: .get) { (callback) in
            callback.onSuccess() { (sessionToken) in
                loadCallback(BaseCallback.success(sessionToken))
            }
                                    
            callback.onFailed() { (error) in
                loadCallback(BaseCallback.failed(error: error))
            }                        
        }
    }    
}
