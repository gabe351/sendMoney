//
//  ContactsCollectionView.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ContactsCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let contactCell = UINib(nibName: ContactCell.NIB_NAME, bundle: nil)
        self.register(contactCell, forCellWithReuseIdentifier: ContactCell.ID)
        
        self.delegate   = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: ContactCell.ID, for: indexPath) as! ContactCell
        cell.configureView()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        return CGSize(width: screenSize.width,
                      height: screenSize.height/7)
    }
}
