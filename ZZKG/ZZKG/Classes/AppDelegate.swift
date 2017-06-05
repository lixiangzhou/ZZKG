//
//  AppDelegate.swift
//  ZZKG
//
//  Created by lixiangzhou on 2017/6/5.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = KGNavigationController(rootViewController: KGMainController())
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

