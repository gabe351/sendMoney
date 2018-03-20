//
//  HistoryPresenter.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 19/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class HistoryPresenter: HistoryPresenterContract {
    
    private let view: HistoryViewContract
    private let getTransfer: GetTransfer
    private let getContacts: GetContacts
    
    init(view: HistoryViewContract,
         getTransfer: GetTransfer,
         getContacts: GetContacts) {
        self.view        = view
        self.getTransfer = getTransfer
        self.getContacts = getContacts
    }
    
    func loadContactTransfers() {
        view.showLoader()
        getTransfer.all { (useCaseCallback) in
            
            useCaseCallback.onSuccess() { (result) in
                
                let contactTransfers = self.buildContactTransfers(transfers: result)
                self.view.show(contactTransfers: contactTransfers)
                
            }
            
            useCaseCallback.onEmptyData {
                self.view.showNoHistory()
            }
            
            useCaseCallback.onFailed() { (error) in
                self.view.showErrorDialog()
            }
            
            
        }
    }
    
    private func buildContactTransfers(transfers: [Transfer]) -> [ContactTransferDto] {
        
        var contactTransfers = [ContactTransferDto]()
        
        for transfer in transfers {
            let contact = self.getContacts.findBy(id: transfer.getClientId())
            let dateFromString = DateConverter.fromIso8601(dateStr: transfer.getDate())!
            
            contactTransfers.append(ContactTransferDto(image: getImageBy(id: contact.id),
                                                       name: contact.name,
                                                       phoneNumber: contact.phoneNumber,
                                                       transferValue: "R$ \(transfer.getWalletValue())",
                                                       date: dateFromString))                        
        }
        
        contactTransfers.sort(by: { (contact1, contact2) -> Bool in
            return contact1.date.compare(contact2.date) == ComparisonResult.orderedDescending            
        })
        
        return contactTransfers
    }
}
