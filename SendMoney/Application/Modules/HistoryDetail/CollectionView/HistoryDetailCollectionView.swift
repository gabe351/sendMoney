//
//  HistoryDetailCollectionView.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 18/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class HistoryDetailCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var transfers = [Transfer]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let contactCell = UINib(nibName: HistoryDetailCell.NIB_NAME, bundle: nil)
        self.register(contactCell, forCellWithReuseIdentifier: HistoryDetailCell.ID)
        
        self.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        self.delegate   = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transfers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: HistoryDetailCell.ID, for: indexPath) as! HistoryDetailCell
        cell.configureView(transfer: transfers[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize: CGRect = self.bounds
        
        return CGSize(width: collectionViewSize.width,
                      height: 25)
    }
}
