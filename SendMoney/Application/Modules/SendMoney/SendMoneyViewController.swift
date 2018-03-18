//
//  SendMoneyViewController.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class SendMoneyViewController: UIViewController {
    
    public static let NIB_NAME = "SendMoney"
    public static let ID       = "SendMoneyId"
    
    @IBOutlet weak var contactImage: RoundedImageView!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactPhoneNumber: UILabel!
    
    var contact: Contact?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueTextField.attributedPlaceholder = NSAttributedString(string: "R$ 0,00",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightBlue])
        hideKeyboardWhenTappedAround()        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        prepareWith(contact: contact!)
    }
    
    @IBAction func closeButtonDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    public func prepareWith(contact: Contact) {
        contactImage.image      = getImageBy(id: contact.id)
        contactName.text        = contact.name
        contactPhoneNumber.text = contact.phoneNumber
    }
}

//MARK StoryboardLoadable implementation
extension SendMoneyViewController: StoryboardLoadable {
    static func storyboardName() -> String {
        return NIB_NAME
    }
    
    static func storyboardIdentifier() -> String {
        return ID
    }    
}
