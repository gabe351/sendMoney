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
    @IBOutlet weak var localLoader: UIActivityIndicatorView!
    
    lazy var presenter: ContactsPresenterContract = {
        return ContactsPresenter(view: self,
                                 saveContacts: InjectionUseCase.provideSaveContacts(),
                                 getContacts: InjectionUseCase.provideGetContacts())
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        contactsCollectionView.parentView = self
        
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.loadContacts()
    }
    
    @IBAction func BackDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureView() {
        backButton.setImage(configureBackButtonImage().image, for: .normal)
        localLoader.color = UIColor.lightBlue
        localLoader.scale(factor: 2)
        showLoader()
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }        
}

//MARK View contract implementation
extension ContactsViewController: ContactsViewContract {
    
    func show(contacts: [Contact]) {
        contactsCollectionView.contacts = contacts
        contactsCollectionView.reloadData()
        hideLoader()
    }
    
    func openSendMoneyDialog(contact: Contact) {
        let viewController = UIStoryboard.loadViewController() as SendMoneyViewController
        viewController.contact = contact
        self.present(viewController, animated: true, completion: nil)
    }
    
    func hideLoader() {
        localLoader.isHidden = true
    }
    
    func showLoader() {
        localLoader.isHidden = false
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

