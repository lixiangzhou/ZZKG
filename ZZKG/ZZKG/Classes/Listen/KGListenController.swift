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
    
    var scrollView: UIScrollView!
    var topView = UIView(frame: CGRect(x: 0, y: 0, width: KGScreenWidth, height: 175))
}

extension KGListenController {
    fileprivate func setupUI() {
        setBG()
        
        setScrollView()
        
        setTop()
        
        setCenter()
    }
    
    private func setTop() {
        // 添加四个按钮
        scrollView.addSubview(topView)
        addBtnToTop(image: "listen_like", title: "我喜欢", action: #selector(like))
        addBtnToTop(image: "listen_musiclist", title: "歌单", action: #selector(musiclist))
        addBtnToTop(image: "listen_download", title: "下载", action: #selector(download))
        addBtnToTop(image: "listen_recent_play", title: "最近", action: #selector(recent_play))
        
        // 四个按钮的布局
        let width = 50
        let padding = (Int(topView.zz_width) - width * topView.subviews.count) / (topView.subviews.count * 2)
        var x = CGFloat(padding)
        for i in 0..<topView.subviews.count {
            let btn = topView.subviews[i]
            btn.zz_x = x
            btn.zz_y = 25
            x += CGFloat(width + padding * 2)
        }
        
        // 分割线
        let sepMargin: CGFloat = 12.5
        let sepLine = topView.zz_add(subview: UIView(frame: CGRect(x: sepMargin, y: topView.zz_height - 60, width: topView.zz_width - sepMargin * 2, height: 0.5)))
        sepLine.backgroundColor = KGLightColor
        
        // 本地音乐
        let localView = topView.zz_add(subview: UIButton(frame: CGRect(x: 0, y: sepLine.zz_maxY, width: topView.zz_width, height: topView.zz_height - sepLine.zz_maxY))) as! UIButton
        localView.addTarget(self, action: #selector(toLocalMusic), for: .touchUpInside)
        let localMusicIcon = localView.zz_add(subview: UIImageView(image: UIImage(named: "listen_local_music"))) as! UIImageView
        localMusicIcon.snp.makeConstraints { (maker) in
            maker.left.equalTo(24)
            maker.centerY.equalTo(localView)
        }
        
        let localLabel = localView.zz_add(subview: UILabel(text: "本地音乐", fontSize: 16, textColor: UIColor.white))
        localLabel.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(localView)
            maker.left.equalTo(localMusicIcon.snp.right).offset(15)
        }
        
        let localNumLabel = localView.zz_add(subview: UILabel(text: "0首", fontSize: 12, textColor: KGLightColor))
        localNumLabel.snp.makeConstraints { (maker) in
            maker.left.equalTo(localLabel.snp.right).offset(13)
            maker.centerY.equalTo(localView)
        }
        
        let localNumArrow = localView.zz_add(subview: UIImageView(image: UIImage(named: "listen_local_arrow")))
        localNumArrow.snp.makeConstraints { (maker) in
            maker.left.equalTo(localNumLabel.snp.right).offset(5)
            maker.centerY.equalTo(localView)
        }
        
        let playLocalBtn = localView.zz_add(subview: UIButton(imageName: "local_play_all", hilightedImageName: "local_play_all", target: self, action: #selector(playLocal)))
        playLocalBtn.snp.makeConstraints { (maker) in
            maker.right.equalTo(-38)
            maker.centerY.equalTo(localMusicIcon)
        }
    }
    
    private func setCenter() {
        
    }
    
    private func setScrollView() {
        scrollView = contentView.zz_add(subview: UIScrollView(frame: CGRect(x: 0, y: 0, width: KGScreenWidth, height: contentView.zz_height))) as! UIScrollView
        scrollView.backgroundColor = UIColor.clear
        scrollView.bounces = true
        scrollView.alwaysBounceVertical = true
        
        let scrollTopIcon = scrollView.zz_add(subview: UIImageView(image: UIImage(named: "watch_home_table_bg_icon_light")))
        scrollTopIcon.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(scrollView.snp.top).offset(-25)
            maker.centerX.equalTo(scrollView)
        }
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
        navigationController?.pushViewController(KGMusicListController(), animated: true)
    }
    
    @objc fileprivate func download() {
        navigationController?.pushViewController(KGDownloadController(), animated: true)
    }
    
    @objc fileprivate func recent_play() {
        navigationController?.pushViewController(KGRecentController(), animated: true)
    }
    
    @objc fileprivate func playLocal() {
        
    }
    
    @objc fileprivate func toLocalMusic() {
        navigationController?.pushViewController(KGLocalMusicController(), animated: true)
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
