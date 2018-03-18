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
        if SendMoneyApplication.getCurrentToken() == nil {
            showCustomAlert()
        } else {
            let viewController = UIStoryboard.loadViewController() as ContactsViewController
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func historyDidPressed(_ sender: Any) {
        if SendMoneyApplication.getCurrentToken() == nil {
            showCustomAlert()
        } else {
            let viewController = UIStoryboard.loadViewController() as HistoryViewController
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    private func showCustomAlert() {
        let customAlert = loadNibNamed(CustomUIAlertViewController.NIB_NAME, owner: self)! as CustomUIAlertViewController
        customAlert.delegate = self
        self.present(customAlert, animated: true, completion: nil)
    }
    
    private func configureView() {
        userImage.defaultRadius()
        authActivityIndicator.color = UIColor.lightBlue        
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
            self.noAuthenticationIcon.isHidden  = true
        }
    }
    
    func hideLoader() {
        UIView.animate(withDuration: 0.5) {
            self.authActivityIndicator.isHidden = true
        }
    }
}
