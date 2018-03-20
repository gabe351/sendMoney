//
//  HistoryViewController.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

public class HistoryViewController: UIViewController {
    
    public static let NIB_NAME = "History"
    public static let ID       = "HisotryId"
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var emptyDataTitle: UILabel!
    @IBOutlet weak var emptyDataContentView: UIView!
    @IBOutlet weak var historyCollectionView: HistoryCollectionView!
    
    @IBOutlet weak var localLoader: UIActivityIndicatorView!
    
    lazy var presenter: HistoryPresenterContract = {
        return HistoryPresenter(view: self,
                                getTransfer: InjectionUseCase.provideGetTransfer(),
                                getContacts: InjectionUseCase.provideGetContacts())
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.loadContactTransfers()
    }
    
    @IBAction func backDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func refreshButtonDidPressed(_ sender: Any) {
        emptyDataContentView.isHidden = true
        presenter.loadContactTransfers()
    }
    
    private func configureView() {
        backButton.setImage(configureBackButtonImage().image, for: .normal)
        refreshButton.setImage(configureRefreshIconImage().image, for: .normal)
        historyCollectionView.parentView = self
        localLoader.color = UIColor.lightBlue
        localLoader.scale(factor: 2)
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }        
}

extension HistoryViewController: HistoryViewContract {
    
    func showNoHistory() {
        hideLoader()
        emptyDataContentView.isHidden  = false
        historyCollectionView.isHidden = true
//        graphView.isHidden             = true
    }
    
    func showErrorDialog() {
        hideLoader()
        let customAlert = loadNibNamed(CustomUIAlertViewController.NIB_NAME, owner: self)! as CustomUIAlertViewController
        customAlert.delegate = self
        self.present(customAlert, animated: true, completion: nil)
    }
    
    func show(contactTransfers: [ContactTransferDto]) {
        hideLoader()
        emptyDataContentView.isHidden          = true
        historyCollectionView.isHidden         = false
        historyCollectionView.contactTransfers = contactTransfers
        historyCollectionView.reloadData()                
    }
    
    func goToHistoryDetail() {
        let viewController = UIStoryboard.loadViewController() as HistoryDetailViewController
        self.present(viewController, animated: true, completion: nil)
    }
    
    func showLoader() {
        localLoader.isHidden = false
    }
    
    func hideLoader() {
        localLoader.isHidden = true
    }
}

//MARK StoryboardLoadable implementation
extension HistoryViewController: StoryboardLoadable {
    
    static func storyboardName() -> String {
        return NIB_NAME
    }
    
    static func storyboardIdentifier() -> String {
        return ID
    }
}

//MARK Custom alert delgate
extension HistoryViewController: CustomAlertDelegate {
    func buttonDidPressed() {
        self.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }
}

