//
//  ContactsCollectionView.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 17/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ContactsCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
        
    var parentView: ContactsViewContract?
    var contacts = [Contact]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let contactCell = UINib(nibName: ContactCell.NIB_NAME, bundle: nil)
        self.register(contactCell, forCellWithReuseIdentifier: ContactCell.ID)
     
        self.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        self.delegate   = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: ContactCell.ID, for: indexPath) as! ContactCell
        cell.configureView(contact: contacts[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        parentView?.openSendMoneyDialog(contact: contacts[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        
        return CGSize(width: screenSize.width,
                      height: 80)
    }
}
