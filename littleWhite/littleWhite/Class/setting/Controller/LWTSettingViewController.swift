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
    
    lazy var settingsArray = { () -> NSMutableArray in
        let lazySettingsArray = NSMutableArray()
        return lazySettingsArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubview()
    }

    func setupSubview() {
        tableView = UITableView.init()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalTo(0)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = rgbColor(r :179, g :235, b :235)
        cell.textLabel?.text = settingsArray.object(at: indexPath.row) as? String
        return cell
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
