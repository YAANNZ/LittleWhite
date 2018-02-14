//
//  LWTSettingViewController.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/7.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit

class LWTSettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView!
    
    lazy var settingsArray = { () -> NSArray in
        let lazySettingsArray = [["决心模式网络", "自定义决心誓言", "桌面图标数字"], ["工作术/FAQ", "支持小白👍", "给本app评分", "给作者留言", "举手猜词"], ["重看新手引导", "重新开始故事模式", "恢复购买"]]
        return lazySettingsArray as NSArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubview()
    }

    func setupSubview() {
        tableView = UITableView.init()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.lightGray
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalTo(0)
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (settingsArray.object(at: section) as! NSArray).count
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")
        if cell == nil {
            cell = UITableViewCell()
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        }
        cell?.textLabel?.text = (settingsArray.object(at: indexPath.section) as! NSArray).object(at: indexPath.row) as? String
        return cell!
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
