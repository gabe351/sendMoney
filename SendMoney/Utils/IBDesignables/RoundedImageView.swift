//
//  RoundedImageView.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    var isInvalidButton = false
    
    func resetBorderColor() {
        layer.borderColor = UIColor.lightBlue.cgColor
        layer.borderWidth = 0.5
        isInvalidButton = false
    }
    
    func highlightBorderColor() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1.0
        isInvalidButton = true
    }
    
    func defaultRadius() {
        layer.cornerRadius = self.frame.width/2
    }
}
