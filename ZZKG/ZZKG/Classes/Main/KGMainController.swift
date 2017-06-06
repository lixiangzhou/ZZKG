//
//  KGMainController.swift
//  ZZKG
//
//  Created by lixiangzhou on 2017/6/5.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

private let KGMainControllerCellID = "KGMainControllerCellID"

class KGMainController: KGViewController {
    
    fileprivate let listenVC = KGListenController()
    fileprivate let lookVC = KGLookController()
    fileprivate let singVC = KGSingController()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

}

extension KGMainController {
    fileprivate func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = view.bounds.size
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: KGMainControllerCellID)
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        addChildViewController(listenVC)
        addChildViewController(lookVC)
        addChildViewController(singVC)
    }
}

extension KGMainController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childViewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KGMainControllerCellID, for: indexPath)
        cell.contentView.zz_removeAllSubviews()
        cell.contentView.addSubview(childViewControllers[indexPath.row].view)
        return cell
    }
    
}
