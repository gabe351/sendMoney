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
            "nome"    : "joao das neves",
            "email"   : "anderson.fernandes@stant.com.br"
        ]
        Alamofire.request("HERE WILL HAVE URL", method: .post, parameters: param)
            
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
