//
//  ContactHistoryCell.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ContactHistoryCell: UICollectionViewCell {
    
    public static let NIB_NAME = "ContactHistoryCell"
    public static let ID       = "ContactHistoryCellId"
    
    @IBOutlet weak var contactImageView: RoundedImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneNumber: UILabel!
    @IBOutlet weak var contactMoneyValue: UILabel!
    
    func configureView(contactTransfer: ContactTransferDto) {
        contactImageView.image  = contactTransfer.image
        contactPhoneNumber.text = contactTransfer.phoneNumber
        contactMoneyValue.text  = contactTransfer.transferValue
        
        setupLayout()
    }
    
    private func setupLayout() {
        contactImageView.defaultRadius()
        contactNameLabel.sizeToFit()
        contactPhoneNumber.sizeToFit()
    }
}
