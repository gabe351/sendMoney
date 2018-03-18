//
//  ContactsLocalDataSourceImpl.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import RealmSwift

public class ContactsLocalDataSourceImpl: ContactsLocalDataSource {
    
    private static var INSTANCE: ContactsLocalDataSourceImpl?
    
    private let realm: Realm
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> ContactsLocalDataSourceImpl {
        if (INSTANCE == nil) {
            INSTANCE = ContactsLocalDataSourceImpl(realm: realm)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func saveMany(contacts: [Contact]) -> [Contact]? {
        let entries: [ContactEntry] = ContactConverter.convertFromEntitesToEntries(entities: contacts)
        
        do {
            try realm.write {
                for entry in entries { realm.add(entry, update: true) }
            }
        } catch {
            return nil
        }
        
        return contacts
    }
    
    func all() -> [Contact] {
        let entries = Array(realm.objects(ContactEntry.self))
        
        return ContactConverter.convertFromEntriesToEntities(entries: entries)
    }
    
    func findBy(id: Int) -> Contact {
        let entry = realm.object(ofType: ContactEntry.self, forPrimaryKey: id)
        
        return ContactConverter.convertFromEntryToEntity(entry!)
    }
    
    func destroyMany(ids: [Int]) {
        do {
            try realm.write {
                let objectsToDelete = realm.objects(ContactEntry.self).filter("id IN %@", ids)
                realm.delete(objectsToDelete)
            }
        } catch {}
    }        
}
