//
//  ToastBuilder.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 19/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation
import Toast_Swift

public class ToastBuilder {
    
    private let message: String
    private let view: UIView
    
    private var block: (Bool) -> Void = { _ in }
    private var durationInSeconds = 1.5
    private var position: ToastPosition = .bottom
    
    var style = ToastStyle()
    
    init(message: String, view: UIView) {
        self.message = message
        self.view    = view
    }
    
    public func with(durationInSeconds: TimeInterval) -> ToastBuilder {
        self.durationInSeconds = durationInSeconds
        
        return self
    }
    
    public func with(position: ToastPosition) -> ToastBuilder {
        self.position = position
        
        return self
    }
    
    public func with(block: @escaping (Bool) -> Void) -> ToastBuilder {
        self.block = block
        
        return self
    }
    
    public func show() {
        
        view.makeToast(message,
            duration: durationInSeconds,
            position: position,
            completion: block)
    }    
}

