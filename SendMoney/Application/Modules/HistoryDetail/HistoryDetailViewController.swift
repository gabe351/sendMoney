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
    @IBOutlet weak var historyDetailCollectionView: HistoryDetailCollectionView!
    
    var contactId: Int?
    
    lazy var presenter: HistoryDetailPresenterContract = {
        return HistoryDetailPresenter(view: self,
                                      getTransfer: InjectionUseCase.provideGetTransfer(),
                                      getContacts: InjectionUseCase.provideGetContacts())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.loadHistoryBy(contactId: contactId!)
    }
    
    @IBAction func closeButtonDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension HistoryDetailViewController: HistoryDetailViewContract {
    
    func show(history: HistoryDto) {
        contactImageView.image       = history.image
        contactNameLabel.text        = history.name
        contactPhoneNumberLabel.text = history.phoneNumber
        historyDetailCollectionView.transfers = history.transfers
        historyDetailCollectionView.reloadData()
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
