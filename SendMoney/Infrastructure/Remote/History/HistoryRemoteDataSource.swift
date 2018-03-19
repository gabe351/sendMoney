//
//  HistoryRemoteDataSource.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol HistoryRemoteDataSource {
    
    func getHistory(token: String, _ loadCallback: @escaping (BaseCallback<Any>) -> Void)
    
}
