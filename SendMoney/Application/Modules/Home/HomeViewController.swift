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
    @IBOutlet weak var authActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var noAuthenticationIcon: UIImageView!
        
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
        
        let viewController: CustomUIAlertViewController = loadNibNamed(CustomUIAlertViewController.NIB_NAME, owner: self)!
        
//        let viewController = UIStoryboard.loadViewController() as SendMoneyViewController
//
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func historyDidPressed(_ sender: Any) {
        
        let viewController = UIStoryboard.loadViewController() as HistoryViewController
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    private func configureView() {
        userImage.defaultRadius()
        authActivityIndicator.backgroundColor = UIColor.lightBlue
        setupNoAuthenticationIcon()
    }
    
    private func setupNoAuthenticationIcon() {
        noAuthenticationIcon.image = UIImage(named: "noAuthenticationIcon")?
            .withRenderingMode(.alwaysTemplate)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

//MARK: View contract implementation
extension HomeViewController: HomeViewContract {
    
    func showAtuhIconError() {
        UIView.animate(withDuration: 0.5) {
            self.noAuthenticationIcon.isHidden = false
        }
    }
    
    func hideAtuhIconError() {
        UIView.animate(withDuration: 0.5) {
            self.noAuthenticationIcon.isHidden = true
        }
    }
    
    func showLoader() {
        UIView.animate(withDuration: 0.5) {
            self.authActivityIndicator.isHidden = false
        }
    }
    
    func hideLoader() {
        UIView.animate(withDuration: 0.5) {
            self.authActivityIndicator.isHidden = true
        }
    }
    
    func showUnauthorizedView() {
        
    }
}
