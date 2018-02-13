//
//  LWTDailyDataViewController.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/7.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit

class LWTDailyDataViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubview()
    }

    func setupSubview() {
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
