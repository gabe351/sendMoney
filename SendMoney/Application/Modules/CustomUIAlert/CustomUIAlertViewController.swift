//
//  CustomUIAlertViewController.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class CustomUIAlertViewController: UIViewController {
    
    @IBOutlet weak var customAlertTitleLabel: UILabel!
    @IBOutlet weak var customAlertTextLabel: UILabel!
    @IBOutlet weak var customAlertButon: RoundedBleButton!
    
    public static let NIB_NAME = "CustomUIAlert"
    public static let ID       = "CustomUIAlertId"
    
    var delegate: CustomAlertDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customAlertTextLabel.sizeToFit()
        
        if UIDevice.current.modelName == UIDevice.IPHONE_5S_ID {
            customAlertTextLabel.text = "Tivemos um erro, tente novamente mais tarde"
        }
    }
    
    @IBAction func buttonDidPressed(_ sender: Any) {
        delegate?.buttonDidPressed()
        self.dismiss(animated: true, completion: nil)
    }    
}
