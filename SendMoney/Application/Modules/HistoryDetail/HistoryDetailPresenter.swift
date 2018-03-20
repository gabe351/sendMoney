//
//  HistoryDetailPresenter.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 20/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class HistoryDetailPresenter: HistoryDetailPresenterContract {
    
    private let view: HistoryDetailViewContract
    private let getTransfer: GetTransfer
    private let getContacts: GetContacts
    
    init(view: HistoryDetailViewContract,
         getTransfer: GetTransfer,
         getContacts: GetContacts) {
        self.view        = view
        self.getTransfer = getTransfer
        self.getContacts = getContacts
    }
    
    func loadHistoryBy(contactId: Int) {
        let contact   = getContacts.findBy(id: contactId)
        let transfers = getTransfer.allTransfersBy(contactId: contactId)
        let transfersOrdened = transfers
            .sorted(by: { DateConverter.fromIso8601(dateStr: $0.getDate())?
                .compare(DateConverter.fromIso8601(dateStr: $1.getDate())!) == .orderedDescending })
        
        let historyDetailDto = HistoryDto(name: contact.name,
                                          phoneNumber: contact.phoneNumber,
                                          transfers: transfersOrdened,
                                          image: getImageBy(id: contact.id))
        
        
        
        view.show(history: historyDetailDto)
    }
    
}
