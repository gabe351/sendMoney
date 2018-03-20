//
//  TransferRepository.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 19/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

protocol TransferRepository {
    func all(_ loadCallback: @escaping (BaseCallback<[Transfer]>) -> Void)
    
    func totalValueBy(contactId: Int) -> Float
    
}
