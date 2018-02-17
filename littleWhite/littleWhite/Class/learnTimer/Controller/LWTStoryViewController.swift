//
//  LWTStoryViewController.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/16.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import UIKit

class LWTStoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.barTintColor = rgbColor(r: 37, g: 37, b: 37)
        
        let backBtn = UIButton.init(type: UIButtonType.custom)
        backBtn.setImage(UIImage.init(named: "nav_back"), for: UIControlState.normal)
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
//        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "nav_back"), style: UIBarButtonItemStyle.done, target: self, action: #selector(dismissVC))
    }

    @objc func dismissVC() {
        self.navigationController?.dismiss(animated: true, completion: nil)
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
