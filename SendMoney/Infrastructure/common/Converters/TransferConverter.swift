//
//  TransferConverter.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class TransferConverter {
    
    static func convertFromEntityToEntry(_ entity: Transfer) -> TransferEntry {
        let entry = TransferEntry()
        
        entry.guid     = UUID().uuidString
        entry.id       = entity.getId()
        entry.clientId = entity.getClientId()
        entry.Value    = entity.getWalletValue()
        entry.token    = entity.getToken()
        entry.date     = DateConverter.fromIso8601(dateStr: entity.getDate())!
        
        return entry
    }
    
    static func convertFromEntryToEntity(_ entry: TransferEntry) -> Transfer {
        return Transfer(id: entry.id,
                        clientId: entry.clientId,
                        walletValue: entry.Value,
                        token: entry.token,
                        date: DateConverter.fromIso8601(date: entry.date)!)
    }
    
    static func convertFromEntitesToEntries(entities: [Transfer]) -> [TransferEntry] {
        var entries = [TransferEntry]()
        
        for entity in entities {
            entries.append(convertFromEntityToEntry(entity))
        }
        
        return entries
    }
    
    static func convertFromEntriesToEntities(entries: [TransferEntry]) -> [Transfer] {
        var entities = [Transfer]()
        
        for entry in entries {
            entities.append(convertFromEntryToEntity(entry))
        }
        
        return entities
    }        
}
