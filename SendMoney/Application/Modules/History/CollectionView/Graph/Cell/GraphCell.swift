//
//  GraphCell.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 20/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class GraphCell: UICollectionViewCell {
    
    public static let NIB_NAME = "GraphCell"
    public static let ID       = "GraphCellId"
    
    @IBOutlet weak var contactImageView: RoundedImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactValueSent: UILabel!
    
    func configureView(contactGraph: ContactGraphDto) {
        
        contactImageView.image = contactGraph.image
        contactNameLabel.text  = contactGraph.name
        contactValueSent.text  = contactGraph.totalValue
    }
    
    func setUpLayout() {
        contactImageView.defaultRadius()
    }
    
}

