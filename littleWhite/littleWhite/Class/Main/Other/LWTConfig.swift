//
//  LWTConfig.swift
//  littleWhite
//
//  Created by ZHUYN on 2018/2/7.
//  Copyright © 2018年 zynabc. All rights reserved.
//

import Foundation
import UIKit

let SCREEN_WIDTH:CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT:CGFloat = UIScreen.main.bounds.size.height
let NAV_HEIGHT:CGFloat = 64

func scaleWidth(width :CGFloat) ->CGFloat{
    return width*SCREEN_WIDTH/375
}

func scaleHeight(height :CGFloat) ->CGFloat{
    return height*SCREEN_HEIGHT/667
}

func rgbColor(r :CGFloat, g :CGFloat, b :CGFloat) ->UIColor{
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}
