//
//  NBUser.swift
//  Ninebot
//
//  Created by 宋晓明 on 16/8/26.
//  Copyright © 2016年 sxm. All rights reserved.
//

import Foundation

func userID() -> String {
    
    let userId = UserDefaults.standard.string(forKey: "nb_uid")
    
    if userId != nil {
        
        return userId!
        
    }
    
    return ""
    
}
