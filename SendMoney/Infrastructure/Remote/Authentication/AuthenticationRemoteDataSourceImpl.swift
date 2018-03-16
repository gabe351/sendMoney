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
        
        let parameters: Parameters = [
            "nome"  : "Gabriel Rosa",
            "email" : "vou@paraneon.com.br"
        ]
                
        ApiDataManager.request(url: "URL", parameters: parameters, method: .get) { (callback) in
            callback.onSuccess() { (jsonObject) in
//                MAPPING JSON TO ENTITY
                loadCallback(BaseCallback.success(jsonObject))
            }
            
            callback.onEmptyData {
                
            }
            
            callback.onFailed() { (error) in
                loadCallback(BaseCallback.failed(error: error))
            }                        
        }
    }    
}
