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
                if result.isEmpty {
                    self.view.showNoHistory()
                } else {
                    let contactTransfers = self.buildContactTransfers(transfers: result)
                    self.view.show(contactTransfers: contactTransfers)
                }
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
            
            contactTransfers.append(ContactTransferDto(image: getImageBy(id: contact.id),
                                                       name: contact.name,
                                                       phoneNumber: contact.phoneNumber,
                                                       transferValue: "R$ \(transfer.getWalletValue())"))
        }
        
        return contactTransfers
    }
}
