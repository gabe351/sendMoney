//
//  TransferResponse.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

public class TransferRequest {
    
    private let id: Int
    private let clientId: Int
    private let walletValue: Float
    private let token: String
    private let date: String
    
    init(id: Int,
         clientId: Int,
         walletValue: Float,
         token: String,
         date: String) {
        
        self.id          = id
        self.clientId    = clientId
        self.walletValue = walletValue
        self.token       = token
        self.date        = date
    }
    
    func getId() -> Int {
        return id
    }
    
    func getClientId() -> Int {
        return clientId
    }
    
    func getWalletValue() -> Float {
        return walletValue
    }
    
    func getToken() -> String {
        return token
    }
    
    func getDate() -> String {
        return date
    }
    
    func asBodyParameters() -> [String: Any] {
        return [
            APIField.id:          getId(),
            APIField.clientId:    getClientId(),
            APIField.walletValue: getWalletValue(),
            APIField.token:       getToken(),
            APIField.data:        getDate()
        ]
    }
    
    private struct APIField {
        static let id          = "Id"
        static let clientId    = "ClienteId"
        static let walletValue = "Valor"
        static let token       = "Token"
        static let data        = "Data"
    }
}
