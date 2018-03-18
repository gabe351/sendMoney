//
//  ContactsPresenter.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class ContactsPresenter: ContactsPresenterContract {
    
    private let view: ContactsViewContract
    private let saveContacts: SaveContacts
    private let getContacts: GetContacts
    
    init(view: ContactsViewContract,
         saveContacts: SaveContacts,
         getContacts: GetContacts) {
        self.view         = view
        self.saveContacts = saveContacts
        self.getContacts  = getContacts
    }
    
    func loadContacts() {        
        saveContacts.save()
        view.show(contacts: getContacts.all())
    }
    
}
