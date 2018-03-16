//
//  AuthenticationApiDataManager.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 15/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Alamofire

public class ApiDataManager {
    
    func request(url: String, parameters: Parameters, method: HTTPMethod, _ loadCallback: @escaping (BaseCallback<Any>) -> Void) {
        Alamofire.request(url, method: method, parameters: parameters)
            .responseJSON { dataResponse in
                switch(dataResponse.result) {
                    
                case .success(let value):
                    loadCallback(BaseCallback.success(value))
                break
                    
                case .failure(let error):
                    loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    }
}
