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
