//
//  NBProgressHUD.swift
//  Ninebot
//
//  Created by 宋晓明 on 16/8/24.
//  Copyright © 2016年 sxm. All rights reserved.
//

import Foundation
import SVProgressHUD

func initProgressHUD() {
    
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear)
    
    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark)
    
    SVProgressHUD.setMinimumDismissTimeInterval(1.0)
}

func progressHUDShow() {
    
    initProgressHUD()
    
    SVProgressHUD.show(withStatus: nb_s_loadings)
}

func progressHUDShowWithStatus(status: String) {
    
    initProgressHUD()
    
    SVProgressHUD.show(withStatus: status)
}

func progressHUDShowWarningWithStatus(status: String) {
    
    initProgressHUD()
    
    SVProgressHUD.showInfo(withStatus: status)
}

func progressHUDShowSuccessWithStatus(status: String) {
    
    initProgressHUD()
    
    SVProgressHUD.showSuccess(withStatus: status)
}

func progressHUDShowErrorWithStatus(status: String) {
    
    initProgressHUD()
    
    SVProgressHUD.showError(withStatus: status)
}

func progressHUDShowErrorWithNetwork(error: NSError) {
    
    let errorDescription = networkError(error: error)
        
    progressHUDShowErrorWithStatus(status: errorDescription)
}

func progressHUDDismiss() {
    
    SVProgressHUD.dismiss()
}

func progressHUDShowSuccessWithStatusLight(status: String) {
    
    initProgressHUD()
    
    SVProgressHUD.setBackgroundColor(UIColor.white)
    
    SVProgressHUD.setForegroundColor(UIColor.black)
    
    SVProgressHUD.showSuccess(withStatus: status)
}

func progressHUDShowSuccessWithStatusNCoin(status: String) {
    
    initProgressHUD()
    
    SVProgressHUD.setMinimumDismissTimeInterval(3.0)
    
    SVProgressHUD.showSuccess(withStatus: status)
}
