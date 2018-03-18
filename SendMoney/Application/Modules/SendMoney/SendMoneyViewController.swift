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
    
    @IBOutlet weak var valueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueTextField.attributedPlaceholder = NSAttributedString(string: "R$ 0,00",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightBlue])
    }
    
    @IBAction func closeButtonDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
