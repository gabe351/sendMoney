//
//  ViewController.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 15/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters: Parameters = [
            "nome" : "gabe",
            "email": "aaa@sss.com.br"
        ]
        
        Alamofire.request("https://swapi.co/api/people/1", method: .get, parameters: parameters)
            .responseJSON { dataResponse in
            
            switch(dataResponse.result) {
                
            case .success(let value):
                print("Sucess")
            break
                
            case .failure(let error):
                print("error")
            break
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

