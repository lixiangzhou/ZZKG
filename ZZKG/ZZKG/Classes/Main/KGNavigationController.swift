//
//  KGNavigationController.swift
//  ZZKG
//
//  Created by lixiangzhou on 2017/6/5.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class KGNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }

}
