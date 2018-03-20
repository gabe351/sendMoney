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
    
    func loadGraphDataBy(contactTransfers: [ContactTransferDto]) {
        
        var contactsGraph = [ContactGraphDto]()
        
        for contactTransfer in contactTransfers {
            let totalValue = getTransfer.totalValueBy(contactId: contactTransfer.id)
            
            let contactGraph = ContactGraphDto(id: contactTransfer.id,
                                               name: contactTransfer.name,
                                               image: getImageBy(id: contactTransfer.id),
                                               totalValue: totalValue)
            contactsGraph.append(contactGraph)
        }
        
        let ilteredContactsGraph = contactsGraph.filterDuplicates{ $0.id == $1.id }
        let sortedArray = ilteredContactsGraph.sorted(by: { $0.totalValue > $1.totalValue })

        view.show(graph: sortedArray)
    }
    
    private func buildContactTransfers(transfers: [Transfer]) -> [ContactTransferDto] {
        
        var contactTransfers = [ContactTransferDto]()
        for transfer in transfers {
            let contact = self.getContacts.findBy(id: transfer.getClientId())
            let dateFromString = DateConverter.fromIso8601(dateStr: transfer.getDate())!
            
            contactTransfers.append(ContactTransferDto(id: contact.id,
                                                       image: getImageBy(id: contact.id),
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
