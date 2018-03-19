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
    @IBOutlet weak var dialogViewContent: RoundView!
    @IBOutlet weak var localLoder: UIActivityIndicatorView!
    
    lazy var presenter: SendMoneyPresenterContract = {
        return SendMoneyPresenter(view: self,
                                  sendMoney: InjectionUseCase.provideSendMoney())
    }()

    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        prepareWith(contact: contact!)
    }
    
    @IBAction func closeButtonDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func sendDidPressed(_ sender: Any) {
                    
        presenter.sendMoney(clientId: (contact?.id)!,
                            value: (valueTextField.text! as NSString).floatValue)
        
    }
    
    private func prepareWith(contact: Contact) {
        contactImage.image      = getImageBy(id: contact.id)
        contactName.text        = contact.name
        contactPhoneNumber.text = contact.phoneNumber
    }
    
    private func configureView() {
        valueTextField.attributedPlaceholder = NSAttributedString(string: "R$ 0,00",
                                                                  attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightBlue])
        localLoder.color = UIColor.lightBlue
        localLoder.scale(factor: 2)
        hideKeyboardWhenTappedAround()
    }
}

extension SendMoneyViewController: SendMoneyViewContract {
    
    func showLoader() {
        dialogViewContent.isHidden = true
        localLoder.isHidden        = false
    }
    
    func hideLoader() {
        dialogViewContent.isHidden = false
        localLoder.isHidden        = true        
    }
    
    func showSuccess() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showErrorDialog() {
        
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
