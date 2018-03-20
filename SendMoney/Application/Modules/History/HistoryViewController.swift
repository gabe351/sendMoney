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
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        HistoryRemoteDataSourceImpl().getHistory(token: SendMoneyApplication.getCurrentToken()!) { (callback) in
            
        }
    }
    
    @IBAction func backDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func refreshButtonDidPressed(_ sender: Any) {
        
    }
    
    private func configureView() {
        backButton.setImage(configureBackButtonImage().image, for: .normal)
        refreshButton.setImage(configureRefreshIconImage().image, for: .normal)
        historyCollectionView.parentView = self
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }        
}

extension HistoryViewController: HistoryViewContract {
    
    func showNoHistory() {
        
    }
    
    func showErrorDialog() {
        
    }
    
    func show(contactTransfers: [ContactTransferDto]) {
        
    }
    
    
    func goToHistoryDetail() {
        let viewController = UIStoryboard.loadViewController() as HistoryDetailViewController
        self.present(viewController, animated: true, completion: nil)
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

