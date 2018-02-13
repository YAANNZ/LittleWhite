//
//  LWTCompletedViewController.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/7.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit

class LWTCompletedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubview()
    }

    func setupSubview() {
        let editBtn = UIButton.init(type: UIButtonType.custom)
        editBtn.setBackgroundImage(UIImage.init(named: "nav_edit"), for: UIControlState.normal)
        editBtn.addTarget(self, action: #selector(editBtnClicked), for: UIControlEvents.touchUpInside)
        self.navigationController?.navigationBar.addSubview(editBtn)
        editBtn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(34)
            make.height.equalTo(34)
            make.top.equalTo(5)
            make.left.equalTo(20)
        }
        
        let addBtn = UIButton.init(type: UIButtonType.custom)
        addBtn.setBackgroundImage(UIImage.init(named: "nav_add"), for: UIControlState.normal)
        addBtn.addTarget(self, action: #selector(addBtnClicked), for: UIControlEvents.touchUpInside)
        self.navigationController?.navigationBar.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(34)
            make.height.equalTo(34)
            make.top.equalTo(5)
            make.right.equalTo(-20)
        }
    }
    
    @objc func editBtnClicked() {
        
    }
    
    @objc func addBtnClicked() {
        
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
