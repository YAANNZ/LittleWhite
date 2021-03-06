//
//  LWTLearnTimerViewController.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/7.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit
import SnapKit

class LWTLearnTimerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var taskTextField: UITextField!
    var msgImgV: UIImageView!
    var littleWhiteImgV: UIImageView!
    
    lazy var tasksArray = { () -> NSMutableArray in
        let lazyTasksArray = NSMutableArray()
        return lazyTasksArray
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
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
        addTaskView.backgroundColor = rgbColor(r: 37, g: 37, b: 37)
        self.view.addSubview(addTaskView)
        addTaskView.snp.makeConstraints { (make) in
            make.height.equalTo(NAV_HEIGHT)
            make.left.top.right.equalTo(0)
        }
        
        taskTextField = UITextField.init()
        taskTextField.attributedPlaceholder = NSAttributedString.init(string: "输入25分钟完成的目标", attributes: [NSAttributedStringKey.foregroundColor:UIColor.lightGray,NSAttributedStringKey.font:UIFont.boldSystemFont(ofSize:15)])
        taskTextField.textColor = .lightGray
        addTaskView.addSubview(taskTextField)
        taskTextField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(SCREEN_WIDTH-60)
            make.height.equalTo(NAV_HEIGHT-30)
            make.left.equalTo(addTaskView).offset(10)
            make.top.equalTo(addTaskView).offset(25)
        }
        
        let addBtn = UIButton.init(type: UIButtonType.custom)
        addBtn.setBackgroundImage(UIImage.init(named: "nav_add"), for: UIControlState.normal)
        addBtn.addTarget(self, action: #selector(addBtnClicked), for: UIControlEvents.touchUpInside)
        addTaskView.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(34)
            make.height.equalTo(NAV_HEIGHT-30)
            make.left.equalTo(taskTextField.snp.right).offset(6)
            make.centerY.equalTo(taskTextField)
        }
        
        tableView = UITableView.init()
        tableView.backgroundColor = rgbColor(r :179, g :235, b :235)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(addTaskView.snp.bottom)
            make.height.equalTo(scaleHeight(height: 236))
        }
        
        littleWhiteImgV = UIImageView()
        littleWhiteImgV.backgroundColor = UIColor.brown
        littleWhiteImgV.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(littleWhiteImgVTap))
        littleWhiteImgV.addGestureRecognizer(tapGesture)
        self.view.addSubview(littleWhiteImgV)
        littleWhiteImgV.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(tableView.snp.bottom).offset(scaleHeight(height: 50))
            make.bottom.equalTo(-49)
        }
        
        msgImgV = UIImageView()
        msgImgV.backgroundColor = rgbColor(r: 234, g: 234, b: 234)
        msgImgV.layer.borderWidth = 1.5
        msgImgV.layer.borderColor = rgbColor(r: 93, g: 93, b: 93).cgColor
        msgImgV.alpha = 0
        self.view.addSubview(msgImgV)
        msgImgV.snp.makeConstraints { (make) in
            make.width.equalTo(scaleWidth(width: 260))
            make.height.equalTo(scaleWidth(width: 175))
            make.bottom.equalTo(self.view.snp.bottom).offset(-49)
            make.right.equalTo(-10)
        }
        
        let startBtn = UIButton.init(type: UIButtonType.custom)
        startBtn.addTarget(self, action: #selector(startBtnClicked), for: UIControlEvents.touchUpInside)
        startBtn.backgroundColor = .red
        startBtn.layer.cornerRadius = 20
        startBtn.setTitle("开始", for: UIControlState.normal)
        self.view.addSubview(startBtn)
        startBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(tableView.snp.bottom).offset(scaleWidth(width: 112))
            make.height.equalTo(40)
            make.width.equalTo(80)
            make.right.equalTo(-10)
        }
        
        let storyBtn = UIButton.init(type: UIButtonType.custom)
        storyBtn.addTarget(self, action: #selector(storyBtnClicked), for: UIControlEvents.touchUpInside)
        storyBtn.backgroundColor = .red
        storyBtn.layer.cornerRadius = 20
        storyBtn.setTitle("故事", for: UIControlState.normal)
        self.view.addSubview(storyBtn)
        storyBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(startBtn.snp.bottom).offset(5)
            make.height.equalTo(40)
            make.width.equalTo(80)
            make.right.equalTo(-10)
        }
        
        let levelView = UIView.init()
        levelView.backgroundColor = .white
        self.view.addSubview(levelView)
        levelView.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(75)
            make.right.equalTo(0)
            make.top.equalTo(storyBtn.snp.bottom).offset(30)
        }
        
        let levelLabel = UILabel()
        levelLabel.text = "新手任务"
        levelLabel.font = UIFont.systemFont(ofSize: 23, weight: UIFont.Weight(rawValue: 1.0))
        levelView.addSubview(levelLabel)
        levelLabel.snp.makeConstraints { (make) in
            make.left.top.equalTo(0)
        }
        
        let learnTimeLabel = UILabel()
        learnTimeLabel.numberOfLines = 0
        learnTimeLabel.text = "总共已进行\n0小时42分钟"
        learnTimeLabel.font = UIFont.systemFont(ofSize: 13)
        levelView.addSubview(learnTimeLabel)
        learnTimeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(levelLabel.snp.bottom)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = rgbColor(r :179, g :235, b :235)
        cell.textLabel?.text = tasksArray.object(at: indexPath.row) as? String
        return cell
    }
    
    
    @objc func addBtnClicked() {
        if ((taskTextField.text?.count) == 0) {
            taskTextField.becomeFirstResponder()
        } else {
            taskTextField.resignFirstResponder()
            tasksArray.add(taskTextField.text as Any)
            tableView.reloadData()
        }
    }
    
    @objc func littleWhiteImgVTap() {
        littleWhiteImgV.isUserInteractionEnabled = false
        if msgImgV.alpha == 0.0{
            
            UIView.animate(withDuration: 0.6, animations: {
                self.msgImgV.alpha = 1.0
                self.msgImgV.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.view.snp.bottom).offset(scaleWidth(width: -225)-49)
                })
                self.view.layoutIfNeeded()
            }, completion: { (isCom) in
                    self.littleWhiteImgV.isUserInteractionEnabled = true
            })
        } else {
            UIView.animate(withDuration: 0.6, animations: {
                self.msgImgV.alpha = 0.0
                self.msgImgV.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.view.snp.bottom).offset(-(SCREEN_HEIGHT-scaleWidth(width: 175)))
                })
                self.view.layoutIfNeeded()
            }, completion: { (isCom) in
                self.msgImgV.snp.updateConstraints({ (make) in
                    make.bottom.equalTo(self.view.snp.bottom).offset(-49)
                })
                self.littleWhiteImgV.isUserInteractionEnabled = true
            })
        }
    }
    
    @objc func startBtnClicked() {
    }
    
    @objc func storyBtnClicked() {
        
        self.present(UINavigationController.init(rootViewController: LWTStoryViewController()), animated: true) {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        taskTextField.resignFirstResponder()
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
