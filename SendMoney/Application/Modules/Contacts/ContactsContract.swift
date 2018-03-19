//
//  ContactsContract.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol ContactsViewContract {
    func show(contacts: [Contact])
    func openSendMoneyDialog(contact: Contact)
    
    func showLoader()
    func hideLoader()
}

protocol ContactsPresenterContract {
    func loadContacts()
}
