//
//  GraphCollectionView.swift
//  SendMoney
//
//  Created by Gabriel Rosa on 20/03/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class GraphCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var parentView: HistoryViewContract?
    var contacsGraph = [ContactGraphDto]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let graphCell = UINib(nibName: GraphCell.NIB_NAME, bundle: nil)
        self.register(graphCell, forCellWithReuseIdentifier: GraphCell.ID)
        
        self.backgroundColor = UIColor.clear.withAlphaComponent(0)
        
        self.delegate   = self
        self.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacsGraph.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: GraphCell.ID, for: indexPath) as! GraphCell
        cell.configureView(contactGraph: contacsGraph[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        parentView?.goToHistoryDetail(contactId: contacsGraph[indexPath.row].id)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        
        return CGSize(width: screenSize.width/3,
                      height: 200)
    }
}
