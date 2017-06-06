//
//  KGViewController.swift
//  ZZKG
//
//  Created by lixiangzhou on 2017/6/5.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class KGViewController: UIViewController {

    let navgationView = UIView(frame: CGRect(x: 0, y: 0, width: KGScreenWidth, height: KGNavHeight))
    let contentView = UIView(frame: CGRect(x: 0, y: KGNavHeight, width: KGScreenWidth, height: KGVCContentHeight))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        setupUI()
    }

    private func setupUI() {
        view.addSubview(navgationView)
        view.addSubview(contentView)
    }
}
