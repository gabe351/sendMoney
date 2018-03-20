//
//  TransferLocalDataSourceImpl.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

public class TransferLocalDataSourceImpl: TransferLocalDataSource {
    
    private static var INSTANCE: TransferLocalDataSourceImpl?
    
    private let realm: Realm
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> TransferLocalDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = TransferLocalDataSourceImpl(realm: realm)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func saveMany(transfers: [Transfer]) -> [Transfer]? {
        let entries: [TransferEntry] = TransferConverter.convertFromEntitesToEntries(entities: transfers)
        
        do {
            try realm.write {
                for entry in entries { realm.add(entry, update: true) }
            }
        } catch {
            return nil
        }
        
        return transfers
    }
    
    func all() -> [Transfer] {
        let entries = Array(realm.objects(TransferEntry.self))
        
        return TransferConverter.convertFromEntriesToEntities(entries: entries)
    }
    
    func findValueBy(contactId: Int) -> Float {
        var contactValue = Float()
        let predicate = NSPredicate(format: "contactId = %@", contactId)
        let entries = Array(realm.objects(TransferEntry.self).filter(predicate))
        
        for entry in entries {
            contactValue += entry.value
        }
        
        let valueFull = entries.reduce(0, { (value, entry) in
            value + entry.value
        })
        
        
        
        return contactValue
    }
    
    func allTransferBy(contactId: Int) -> [Transfer] {
        let predicate = NSPredicate(format: "contactId = %@", contactId)
        
        let entries = Array(realm.objects(TransferEntry.self).filter(predicate))
        
        return TransferConverter.convertFromEntriesToEntities(entries: entries)
    }
    
    func destroyAll() {
        let entries = realm.objects(TransferEntry.self)
        realm.delete(entries)
    }
}
