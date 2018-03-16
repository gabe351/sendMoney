//
//  AuthenticateRemoteDataSource.swift
//  SendMoney
//
//  Created by Stant 02 on 16/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol AuthenticateRemoteDataSource {
    func authencticate(_ loadCallback: @escaping (BaseCallback<Any>) -> Void)
}
