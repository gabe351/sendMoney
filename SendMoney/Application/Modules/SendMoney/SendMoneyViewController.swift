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
        
        if valueTextField.text!.isEmpty {
            ToastBuilder(message: "Por favor, informe o valor", view: self.view).show()
            return
        }
        
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
        ToastBuilder(message: "Enviado com sucesso", view: self.view).with(block: { (didTapped) in
          self.dismiss(animated: true, completion: nil)
        }).with(position: .center).with(durationInSeconds: 0.8)
            .show()
        localLoder.isHidden = true
    }
    
    func showErrorDialog() {
        let customAlert = loadNibNamed(CustomUIAlertViewController.NIB_NAME, owner: self)! as CustomUIAlertViewController
        customAlert.delegate = self
        self.present(customAlert, animated: true, completion: nil)
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

//MARK Custom alert delgate
extension SendMoneyViewController: CustomAlertDelegate {
    func buttonDidPressed() {        
        localLoder.isHidden = true
        self.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
}
