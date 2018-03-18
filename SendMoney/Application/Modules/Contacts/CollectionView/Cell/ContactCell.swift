//
//  ContactCell.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    public static let NIB_NAME = "ContactCell"
    public static let ID       = "ContactCellId"
    @IBOutlet weak var contactImageView: RoundedImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneNumber: UILabel!
    
    func configureView(contact: Contact) {
        
        contactImageView.image  = getImageBy(id: contact.id)
        contactNameLabel.text   = contact.name
        contactPhoneNumber.text = contact.phoneNumber
        
        setupLayout()
    }
    
    private func setupLayout() {
        contactImageView.defaultRadius()
        contactNameLabel.sizeToFit()
        contactPhoneNumber.sizeToFit()
    }
}
