//
//  SendMoney.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class SendMoney {
    private let remoteDataSource: TransferRemoteDataSource
    
    init(remoteDataSource: TransferRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    func transfer(parameters: [String:Any], _ loadCallback: @escaping (BaseCallback<Any>) -> Void) {
        remoteDataSource.sendTransfer(parameters: parameters, loadCallback)
    }
}
