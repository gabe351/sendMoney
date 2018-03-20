//
//  GetHistory.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class GetTransfer {
    
    private let repository: TransferRepository
    
    init(repository: TransferRepository) {
        self.repository = repository
    }
    
    func all(_ loadCallback: @escaping (BaseCallback<[Transfer]>) -> Void) {
        repository.all(loadCallback)
    }
    
    func totalValueBy(contactId: Int) -> Float {
        return repository.totalValueBy(contactId: contactId)
    }
    
    func allTransfersBy(contactId: Int) -> [Transfer] {
        return repository.allTransferBy(contactId: contactId) 
    }
}

