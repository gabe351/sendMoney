//
//  ContactsViewController.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

public class ContactsViewController: UIViewController {
    
    public static let NIB_NAME = "Contacts"
    public static let ID       = "ContactsId"
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var contactsCollectionView: ContactsCollectionView!
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        contactsCollectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)

    }
    
    @IBAction func BackDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureView() {
        backButton.setImage(configureBackButtonImage().image, for: .normal)
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }        
}

//MARK StoryboardLoadable implementation
extension ContactsViewController: StoryboardLoadable {
    
    static func storyboardName() -> String {
        return NIB_NAME
    }
    
    static func storyboardIdentifier() -> String {
        return ID
    }
}

