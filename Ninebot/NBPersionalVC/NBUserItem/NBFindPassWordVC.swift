//
//  NBFindPassWordVC.swift
//  Ninebot
//
//  Created by 宋晓明 on 16/8/23.
//  Copyright © 2016年 sxm. All rights reserved.
//

import Foundation

class NBFindPassWordVC: NBBaseVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = nb_s_forgetPwd
        
        view.backgroundColor = RGB(r: 246.0, g: 246.0, b: 246.0, alpha: 1.0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
