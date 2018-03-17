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
    
    
    lazy var presenter: HomePresenterContract = {
        return HomePresenter(view: self,
                             getAuth: InjectionUseCase.provideGetAuth(),
                             saveSessionToken: InjectionUseCase.provideSaveSesstionToken())
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showLoader()
        
        
        
        presenter.authenticateUser()
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
