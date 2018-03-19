//
//  RemoteUtils.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class RemoteUtils {
    private static let BASE_URL = "https://processoseletivoneon.neonhomol.com.br/"
    static func buildUrl(path: String) -> String {
        return "\(BASE_URL)\(path)"
    }
    
    static func buildAuthParameters(name: String = "Gabriel Rosa", email: String = "vou@trabalharnoneon.com.br") -> [String:Any] {
        let parameters: [String: Any] = [
            "nome" : name,
            "email": email
        ]
        
        return parameters
    }
    
    static func buildHistoryParameters(token: String = SendMoneyApplication.getCurrentToken()!) -> [String: Any] {
        let parameters: [String: Any] = [
            "token" : token
        ]
        
        return parameters
    }
}
