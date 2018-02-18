//
//  LWTDailyDataViewController.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/7.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit

class LWTDailyDataViewController: UIViewController {

    var efficiencyView: UIView!
    var levelView: UIView!
    var timeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubview()
    }

    func setupSubview() {
        
        self.view.backgroundColor = rgbColor(r: 230, g: 230, b: 230)
        
        let shareBtn = UIButton.init(type: UIButtonType.custom)
        shareBtn.setBackgroundImage(UIImage.init(named: "nav_add"), for: UIControlState.normal)
        shareBtn.addTarget(self, action: #selector(shareBtnClicked), for: UIControlEvents.touchUpInside)
        self.navigationController?.navigationBar.addSubview(shareBtn)
        shareBtn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(34)
            make.height.equalTo(34)
            make.left.equalTo(20)
            make.top.equalTo(5)
        }
        
        efficiencyView = UIView()
        efficiencyView.layer.cornerRadius = 10
        efficiencyView.backgroundColor = .white
        self.view.addSubview(efficiencyView)
        efficiencyView.snp.makeConstraints { (make) in
            make.top.equalTo(15+NAV_HEIGHT)
            make.height.equalTo(SCREEN_WIDTH-40)
            make.width.equalTo(SCREEN_WIDTH-60)
            make.centerX.equalTo(SCREEN_WIDTH/2)
        }
        
        levelView = UIView()
        levelView.layer.cornerRadius = 10
        levelView.backgroundColor = .white
        self.view.addSubview(levelView)
        levelView.snp.makeConstraints { (make) in
            make.top.equalTo(20+NAV_HEIGHT)
            make.height.equalTo(SCREEN_WIDTH-40)
            make.width.equalTo(SCREEN_WIDTH-50)
            make.centerX.equalTo(SCREEN_WIDTH/2)
        }
        
        timeView = UIView()
        timeView.layer.cornerRadius = 10
        timeView.backgroundColor = .white
        self.view.addSubview(timeView)
        timeView.snp.makeConstraints { (make) in
            make.top.equalTo(25+NAV_HEIGHT)
            make.height.equalTo(SCREEN_WIDTH-40)
            make.width.equalTo(SCREEN_WIDTH-40)
            make.centerX.equalTo(SCREEN_WIDTH/2)
        }
        
        let panGeusture = UIPanGestureRecognizer.init(target: self, action: #selector(panGeustures))
        timeView.addGestureRecognizer(panGeusture)
    }
    
    @objc func panGeustures() {
        
    }
    
    @objc func shareBtnClicked() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
