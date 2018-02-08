//
//  LWTLearnTimerViewController.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/7.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit
import SnapKit

class LWTLearnTimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func setupSubviews() {
        let addTaskView = UIView.init()
        addTaskView.backgroundColor = UIColor.init(red: 37/255.0, green: 37/255.0, blue: 37/255.0, alpha: 1.0)
        self.view.addSubview(addTaskView)
        addTaskView.snp.makeConstraints { (make) in
            make.height.equalTo(NAV_HEIGHT)
            make.left.top.right.equalTo(0)
        }
        
        let taskTextField = UITextField.init()
        taskTextField.attributedPlaceholder = NSAttributedString.init(string: "输入25分钟完成的目标", attributes: [NSAttributedStringKey.foregroundColor:UIColor.lightGray,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize:15)])
        taskTextField.textColor = .lightGray
        addTaskView.addSubview(taskTextField)
        taskTextField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_WIDTH-60)
            make.height.equalTo(NAV_HEIGHT-30)
            make.left.equalTo(addTaskView).offset(10)
            make.top.equalTo(addTaskView).offset(25)
        }
        
        let addBtn = UIButton.init(type: UIButtonType.contactAdd)
        addTaskView.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(34)
            make.height.equalTo(NAV_HEIGHT-30)
            make.left.equalTo(taskTextField.snp.right).offset(6)
            make.centerY.equalTo(taskTextField)
        }
        
        let tableview = UITableView.init()
        tableview.backgroundColor = rgbColor(r :179, g :235, b :235)
        self.view.addSubview(tableview)
        tableview.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(addTaskView.snp.bottom)
            make.height.equalTo(scaleHeight(height: 236))
        }
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
