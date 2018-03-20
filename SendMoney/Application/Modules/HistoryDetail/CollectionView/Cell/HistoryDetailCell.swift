//
//  HistoryDetailCell.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class HistoryDetailCell: UICollectionViewCell {
    
    public static let NIB_NAME = "HistoryDetailCell"
    public static let ID       = "HistoryDetailCellId"
    
    @IBOutlet weak var transferDate: UILabel!
    @IBOutlet weak var transferValue: UILabel!
    
    func configureView(transfer: Transfer) {
        let date = DateConverter.fromIso8601(dateStr: transfer.getDate())
        transferDate.text  = DateConverter.buildDateOnBrazilianFormat(date!)
        transferValue.text = "R$ \(transfer.getWalletValue())"
    }
}
