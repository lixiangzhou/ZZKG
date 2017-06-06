//
//  KGListenController.swift
//  ZZKG
//
//  Created by lixiangzhou on 2017/6/5.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class KGListenController: KGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.zz_random
        
        setupUI()
    }
    
}

extension KGListenController {
    fileprivate func setupUI() {
        let navigationViewBG = UIImageView(image: UIImage(named: "home_top_bg"))
        navigationViewBG.frame = navigationView.bounds
        navigationView.addSubview(navigationViewBG)
        
        let contentViewBG = UIImageView(image: UIImage(named: "home_listen_bg_one"))
        contentViewBG.frame = contentView.bounds
        contentView.addSubview(contentViewBG)
    }
}
