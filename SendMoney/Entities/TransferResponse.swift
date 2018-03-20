//
//  TransferResponse.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 19/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import ObjectMapper

public class TransferResponse: NSObject, Mappable {
    
    var id: Int?
    var clientId: Int?
    var walletValue: Float?
    var token: String?
    var date: String?
    
    override init() {
        super.init()
    }
    
    convenience required public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        
        id          <- map[APIField.id]
        clientId    <- map[APIField.clientId]
        walletValue <- map[APIField.walletValue]
        token       <- map[APIField.token]
        date        <- map[APIField.data]
        
    }
    
    private struct APIField {
        static let id          = "Id"
        static let clientId    = "ClienteId"
        static let walletValue = "Valor"
        static let token       = "Token"
        static let data        = "Data"
    }
}
