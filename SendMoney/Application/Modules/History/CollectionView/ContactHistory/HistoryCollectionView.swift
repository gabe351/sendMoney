//
//  HistoryCollectionView.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class HistoryCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var parentView: HistoryViewContract?
    var contactTransfers = [ContactTransferDto]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let contactCell = UINib(nibName: ContactHistoryCell.NIB_NAME, bundle: nil)
        self.register(contactCell, forCellWithReuseIdentifier: ContactHistoryCell.ID)
        
        self.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        self.delegate   = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contactTransfers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: ContactHistoryCell.ID, for: indexPath) as! ContactHistoryCell
        cell.configureView(contactTransfer: contactTransfers[indexPath.row])
        return cell
    }
            
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        
        return CGSize(width: screenSize.width,
                      height: 80)
    }
}

