//
//  KGContainerController.swift
//  ZZKG
//
//  Created by lixiangzhou on 2017/6/5.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

class KGContainerController: KGViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let nav = KGNavigationController(rootViewController: KGMainController())
        
        addChildViewController(nav)
        
        view.addSubview(nav.view)
    }

}
