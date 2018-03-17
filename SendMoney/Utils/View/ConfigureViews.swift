//
//  ConfigureButtons.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

func configureBackButtonImage() -> UIImageView {
    let backArrowImageView   = UIImageView()
    backArrowImageView.image = UIImage(named: "backArrow")?
        .withRenderingMode(.alwaysTemplate)
    
    return backArrowImageView
}
