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
    
    var topView = UIView(frame: CGRect(x: 0, y: 0, width: KGScreenWidth, height: 175))
}

extension KGListenController {
    fileprivate func setupUI() {
        setBG()
        
        setTop()
        
        setCenter()
    }
    
    private func setTop() {
        contentView.addSubview(topView)
        addBtnToTop(image: "listen_like", title: "我喜欢", action: #selector(like))
        addBtnToTop(image: "listen_musiclist", title: "歌单", action: #selector(musiclist))
        addBtnToTop(image: "listen_download", title: "下载", action: #selector(download))
        addBtnToTop(image: "listen_recent_play", title: "最近", action: #selector(recent_play))
        
        let width = 50
        let padding = (Int(KGScreenWidth) - width * topView.subviews.count) / (topView.subviews.count * 2)
        var x = CGFloat(padding)
        for i in 0..<topView.subviews.count {
            let btn = topView.subviews[i]
            btn.zz_x = x
            btn.zz_y = 25
            x += CGFloat(width + padding * 2)
        }
        
        
        
        
        
    }
    
    private func setCenter() {
        
    }
    
    private func setBG() {
        let navigationViewBG = UIImageView(image: UIImage(named: "home_top_bg"))
        navigationViewBG.frame = navigationView.bounds
        navigationView.addSubview(navigationViewBG)
        
        let contentViewBG = UIImageView(image: UIImage(named: "home_listen_bg_one"))
        contentViewBG.frame = contentView.bounds
        contentView.addSubview(contentViewBG)
    }
    
    private func addBtnToTop(image: String, title: String, action: Selector) {
        let btn = KGTopImageButton(title: title, fontSize: 16, titleColor: UIColor.white, imageName: image, hilightedImageName: image + "_on", target: self, action: action)
        btn.titleLabel?.textAlignment = .center
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageRect = CGRect(x: 0, y: 0, width: 50, height: 40)
        btn.titleRect = CGRect(x: 0, y: 40, width: 50, height: 18)
        topView.addSubview(btn)
    }
}

extension KGListenController {
    @objc fileprivate func like() {
        navigationController?.pushViewController(KGLikeController(), animated: true)
    }
    
    @objc fileprivate func musiclist() {
        navigationController?.pushViewController(KGSongListController(), animated: true)
    }
    
    @objc fileprivate func download() {
        navigationController?.pushViewController(KGDownloadController(), animated: true)
    }
    
    @objc fileprivate func recent_play() {
        navigationController?.pushViewController(KGRecentController(), animated: true)
    }
}


class KGTopImageButton: UIButton {
    var imageRect = CGRect.zero
    var titleRect = CGRect.zero
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        return imageRect
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        return titleRect
    }
}
