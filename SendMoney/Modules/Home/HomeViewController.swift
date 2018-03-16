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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AuthenticationApiDataManager().authenticate { (apiCallback) in
            apiCallback.onSuccess() { (value) in
                print("success")                
            }
            
            apiCallback.onFailed() { (_) in
                print("failed")
            }
        }
    }
}
