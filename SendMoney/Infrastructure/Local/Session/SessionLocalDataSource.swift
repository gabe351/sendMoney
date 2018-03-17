//
//  AuthenticationLocalDataSource.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

protocol SessionLocalDataSource {
    
    func save(token: String)
    
    func getToken() -> String?
    
    func destroy()
    
}
