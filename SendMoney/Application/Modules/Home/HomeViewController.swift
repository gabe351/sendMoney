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
        
        presenter.authenticateUser()
    }
}

//MARK: View contract implementation
extension HomeViewController: HomeViewContract {
    
    func showAuthIconSuccess() {
        print("aaa")
        
    }
    
    func showAtuhIconError() {
        print("aaa")
    }
    
    func showLoader() {
        print("aaa")
    }
    
    func hideLoader() {
        print("aaa")
    }
}
