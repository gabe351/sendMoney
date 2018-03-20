//
//  HistoryDto.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 20/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

struct HistoryDto {
    let name:        String
    let phoneNumber: String
    let transfers:   [Transfer]
    let image:       UIImage
}
