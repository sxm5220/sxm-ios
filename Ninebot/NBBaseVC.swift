//
//  NBBaseVC.swift
//  Ninebot
//
//  Created by 宋晓明 on 16/8/17.
//  Copyright © 2016年 sxm. All rights reserved.
//

import UIKit

class NBBaseVC: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColorFromRGB(rgbValue: 0x007897)
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white];
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
