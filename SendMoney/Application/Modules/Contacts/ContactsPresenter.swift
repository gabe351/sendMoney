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
    private let getContacts: GetContacts
    
    init(view: ContactsViewContract,         
         getContacts: GetContacts) {
        self.view         = view
        self.getContacts  = getContacts
    }
    
    func loadContacts() {
        view.show(contacts: getContacts.all())
    }
    
}
