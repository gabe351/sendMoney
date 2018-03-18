//
//  ContactConverter.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ContactConverter {
    
    static func convertFromEntityToEntry(_ entity: Contact) -> ContactEntry {
        let entry = ContactEntry()
        
        entry.id          = entity.id
        entry.name        = entity.name
        entry.email       = entity.email
        entry.phoneNumber = entity.phoneNumber
        entry.image       = entity.image
        
        return entry
    }
    
    static func convertFromEntryToEntity(_ entry: ContactEntry) -> Contact {
        return Contact(id: entry.id,
                       name: entry.name,
                       email: entry.email,
                       phoneNumber: entry.phoneNumber,
                       image: entry.image)
    }
    
    static func convertFromEntitesToEntries(entities: [Contact]) -> [ContactEntry] {
        var entries = [ContactEntry]()
        
        for entity in entities {
            entries.append(convertFromEntityToEntry(entity))
        }
        
        return entries
    }
    
    static func convertFromEntriesToEntities(entries: [ContactEntry]) -> [Contact] {
        var entities = [Contact]()
        
        for entry in entries {
            entities.append(convertFromEntryToEntity(entry))
        }
        
        return entities
    }
}
