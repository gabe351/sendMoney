//
//  AuthenticationApiDataManager.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 15/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

public class ApiDataSource {
    
    public static func simpleRequest(url: String, parameters: Parameters, method: HTTPMethod, _ loadCallback: @escaping (BaseCallback<Any>) -> Void) {
        Alamofire.request(url, method: method, parameters: parameters)
            .responseJSON { dataResponse in
                switch(dataResponse.result) {
                    
                case .success(let response):
                    loadCallback(BaseCallback.success(response))
                break
                    
                case .failure(let error):
                    loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    }
    
    public static func requestTransfers(url: String, parameters: Parameters, method: HTTPMethod, _ loadCallback: @escaping (BaseCallback<[TransferResponse]>) -> Void) {
        Alamofire.request(url, method: method, parameters: parameters).responseArray { (response: DataResponse<[TransferResponse]>) in
            switch(response.result) {
                
            case .success(let response):
                loadCallback(BaseCallback.success(response))
                break
                
            case .failure(let error):
                loadCallback(BaseCallback.failed(error: error))
                break
            }
        }
    }
}
