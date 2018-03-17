//
//  HomeViewController.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 15/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UIViewController {
    
    public static let NIB_NAME = "Home"
    public static let ID       = "HomeId"
    
    @IBOutlet weak var userImage: RoundedImageView!
    
    lazy var presenter: HomePresenterContract = {
        return HomePresenter(view: self,
                             getAuth: InjectionUseCase.provideGetAuth(),
                             saveSessionToken: InjectionUseCase.provideSaveSesstionToken())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        
        presenter.authenticateUser()
    }
    
    
    @IBAction func sendMoneyDidPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: SendMoneyViewController.NIB_NAME, bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: SendMoneyViewController.ID)
            as! SendMoneyViewController
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func historyDidPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: HistoryViewController.NIB_NAME, bundle: nil)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: HistoryViewController.ID)
            as! HistoryViewController
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func configureView() {
        userImage.defaultRadius()
        showLoader()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//MARK: View contract implementation
extension HomeViewController: HomeViewContract {
    
    func showAuthIconSuccess() {
        print("aaa")
        hideLoader()
    }
    
    func showAtuhIconError() {
        print("aaa")
        hideLoader()
    }
    
    func showLoader() {
        print("aaa")
    }
    
    func hideLoader() {
        print("aaa")
    }
    
    func showUnauthorizedLoader() {
        
    }
    
    func hideUnauthorizedLoader() {
        
    }
}
