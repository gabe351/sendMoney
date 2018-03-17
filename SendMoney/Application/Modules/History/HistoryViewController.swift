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
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    @IBAction func backDidPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func configureView() {
        backButton.setImage(configureBackButtonImage().image, for: .normal)
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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

