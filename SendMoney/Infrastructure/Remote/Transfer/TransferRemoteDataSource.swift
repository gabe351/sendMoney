//
//  TransferRemoteDataSource.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Alamofire

protocol TransferRemoteDataSource {
    
    func sendTransfer(parameters: Parameters, _ loadCallback: @escaping (BaseCallback<Any>) -> Void)
}
