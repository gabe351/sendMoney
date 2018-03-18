//
//  ContactEntry.swift
//  SendMoney
//
//  Created by Stant 02 on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ContactEntry: Entry {
    
    @objc dynamic var id          = Int()
    @objc dynamic var name        = ""
    @objc dynamic var email       = ""
    @objc dynamic var phoneNumber = ""
    @objc dynamic var image       = UIImage()
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

