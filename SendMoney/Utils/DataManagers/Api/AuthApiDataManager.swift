//
//  AuthenticationApiDataManager.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 15/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Alamofire

public class AuthenticationApiDataManager {
    
    func authenticate(_ loadCallback: @escaping (BaseCallback<Any>) -> Void) {
        let param: Parameters = [
            "email"       : "anderson.fernandes@stant.com.br",
            "password"    : "12345678",
            "device_id"   : "idiOS",
            "device_type" : "android"
        ]
        Alamofire.request("http://stage.stant.com.br/api//v1/authenticate/access_token", method: .post, parameters: param)
            
            .responseJSON { dataResponse in
                
                switch(dataResponse.result) {
                    
                case .success(let value):
                    loadCallback(BaseCallback.success(value))
                    print("Success")
                break
                    
                case .failure(let error):
                    loadCallback(BaseCallback.failed(error: error))
                    print("error")
                break
                }
        }
        
    }
    
}
