//
//  KGLightingTabView.swift
//  ZZKG
//
//  Created by lixiangzhou on 2017/6/6.
//  Copyright © 2017年 lixiangzhou. All rights reserved.
//

import UIKit

protocol KGLightingTabViewDelegate: NSObjectProtocol {
    func lightingTabViewDidClick(index: Int)
}

class KGLightingTabView: UIView {
    
    private var bottomLine: UIView = UIView()
    private var selectTab: UIButton?
    
    weak var delegate: KGLightingTabViewDelegate?
    
    var tabs: [String]? {
        didSet {
            guard let tabs = tabs else {
                return
            }
            
            zz_removeAllSubviews()
            
            let padding: CGFloat = 34
            var x: CGFloat = 0
            let y: CGFloat = 0
            let height: CGFloat = 44
            
            for i in 0..<tabs.count {
                let tab = tabs[i]
                let btn = UIButton(imageName: tab, hilightedImageName: tab + "_on", selectedImageName: tab + "_on", target: self, action: #selector(click(tab:)))
                btn.tag = i
                
                let width = UIImage(named: tab)?.size.width ?? 0
                btn.frame = CGRect(x: x, y: y, width: width, height: height)
                addSubview(btn)
                
                x += width + padding
            }
            
            if x > 0 {
                frame = CGRect(x: 0, y: 0, width: x - padding, height: 0)
                bottomLine.backgroundColor = UIColor.white
                addSubview(bottomLine)
                selectTab = subviews.first as? UIButton
                let tab = selectTab!
                bottomLine.frame = CGRect(x: tab.zz_x, y: tab.zz_height - 1, width: tab.zz_width, height: 1)
                click(tab: selectTab!)
            }
        }
    }
    
    var index: Int = 0 {
        didSet {
            let tab = subviews[index] as! UIButton
            click(tab: tab)
        }
    }
    
    @objc private func click(tab: UIButton) {
        selectTab?.isSelected = false
        tab.isSelected = true
        self.selectTab = tab
        
        UIView.animate(withDuration: 0.25) {
            self.bottomLine.frame = CGRect(x: tab.zz_x, y: tab.zz_height - 1, width: tab.zz_width, height: 1)
        }
        
        delegate?.lightingTabViewDidClick(index: tab.tag)
    }
}
