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
    
    fileprivate let userIcon = UIImageView(image: UIImage(named: "user_default_avator"))
    fileprivate let lightingTabView = KGLightingTabView()
    fileprivate let rightBtn = UIButton()
    
    fileprivate var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension KGMainController {
    fileprivate func setupUI() {
        automaticallyAdjustsScrollViewInsets = false
        
        setNav()
        setContent()
        
        view.bringSubview(toFront: navigationView)
    }
    
    private func setNav() {
//        navigationView.backgroundColor = UIColor.blue
        navigationView.addSubview(userIcon)
        userIcon.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(-3)
            maker.left.equalTo(20)
            maker.width.height.equalTo(32.5)
        }
        
        
        lightingTabView.tabs = ["listen", "watch", "sing"]
        lightingTabView.delegate = self
        navigationView.addSubview(lightingTabView)
        lightingTabView.snp.makeConstraints { (maker) in
            maker.bottom.centerX.equalTo(navigationView)
            maker.height.equalTo(44)
            maker.width.equalTo(lightingTabView.zz_width)
        }
        
        
        rightBtn.setImage(UIImage(named: "home_top_search"), for: .normal)
        rightBtn.sizeToFit()
        navigationView.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(-20)
            maker.bottom.equalTo(-10)
        }
    }
    
    private func setContent() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = view.bounds.size
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: KGMainControllerCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        addChildViewController(listenVC)
        addChildViewController(lookVC)
        addChildViewController(singVC)
    }
}

extension KGMainController: KGLightingTabViewDelegate {
    func lightingTabViewDidClick(index: Int) {
        rightBtn.setImage(UIImage(named: index == 1 ? "watch_home_follow_tabbtn" : "home_top_search"), for: .normal)
        rightBtn.setImage(UIImage(named: index == 1 ? "watch_home_follow_tabbtn" : "home_top_search_on"), for: .highlighted)
        
        collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
}

extension KGMainController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childViewControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KGMainControllerCellID, for: indexPath)
        cell.contentView.zz_removeAllSubviews()
        cell.contentView.addSubview(childViewControllers[indexPath.row].view)
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        lightingTabView.index = Int(round(scrollView.contentOffset.x / scrollView.bounds.width))
    }
}
