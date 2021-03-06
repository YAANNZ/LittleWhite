//
//  LWTTabBarController.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/7.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit

class LWTTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let kClassKey = "rootVCClassString"
        let kTitleKey = "title"
        let kImgKey = "imageName"
        let kSelImgKey = "selectedImageName"
        
        let childItemsArray:NSArray = [
            [kClassKey : "littleWhite.LWTLearnTimerViewController",
             kTitleKey  : "学习计时",
             kImgKey    : "time",
             kSelImgKey : "time_sel"],
            
            [kClassKey : "littleWhite.LWTDailyDataViewController",
             kTitleKey  : "每日数据",
             kImgKey    : "dailyData",
             kSelImgKey : "dailyData_sel"],
            
            [kClassKey  : "littleWhite.LWTCompletedViewController",
             kTitleKey  : "已完成目标",
             kImgKey    : "completed",
             kSelImgKey : "completed_sel"],
            
            [kClassKey : "littleWhite.LWTSettingViewController",
             kTitleKey  : "设置",
             kImgKey    : "setting",
             kSelImgKey : "setting_sel"] ];
        
        for item in childItemsArray {
            let vcItem = item as! NSDictionary
            let vcClass = NSClassFromString(vcItem.object(forKey: kClassKey) as! String) as! UIViewController.Type
            let VC = vcClass.init()
            let navVC = UINavigationController.init(rootViewController: VC)
            VC.title = vcItem.object(forKey: kTitleKey) as? String
            navVC.tabBarItem.image = UIImage.init(named: vcItem.object(forKey: kImgKey) as! String)
            navVC.tabBarItem.selectedImage = UIImage.init(named: vcItem.object(forKey: kSelImgKey) as! String)
            navVC.navigationBar.barTintColor = rgbColor(r: 37, g: 37, b: 37)
            navVC.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor :UIColor.black], for: UIControlState.selected)
            self.addChildViewController(navVC)
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
