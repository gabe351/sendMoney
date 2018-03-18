//
//  HistoryDetailViewController.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController {
 
    public static let NIB_NAME = "HistoryDetail"
    public static let ID       = "HistoryDetailId"
    
    @IBOutlet weak var contactImageView: RoundedImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactPhoneNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func closeButtonDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension HistoryDetailViewController: StoryboardLoadable {
    
    static func storyboardName() -> String {
        return NIB_NAME
    }
    
    static func storyboardIdentifier() -> String {
        return ID
    }            
}
