//
//  NBHelper.swift
//  Ninebot
//
//  Created by 宋晓明 on 16/8/17.
//  Copyright © 2016年 sxm. All rights reserved.
//

import Foundation
import UIKit

func networkError(error: NSError) -> String{
    
    var errorDescription: String
    
    switch (error.code) {
        
    case NSURLErrorCancelled://取消网络请求
        errorDescription = "";
        
    case NSURLErrorBadServerResponse: //404 not found
        errorDescription = nb_s_connect_exception;
        
    case NSURLErrorTimedOut://超时
        errorDescription = nb_s_outTimer;
        
    case NSURLErrorNotConnectedToInternet://无网络
        errorDescription = nb_s_noNetwork;
        
    default:
        errorDescription = nb_s_connect_exception;
        
    }
    return errorDescription;
}

func attributedTitle(str: String) -> NSMutableAttributedString {
    
    let strings = NSMutableAttributedString.init(string: str)
    
    let strRange = NSRange.init(location: 0, length: strings.length)
    
    strings.addAttribute(NSUnderlineStyleAttributeName, value: 1, range: strRange)
    
    return strings
    
}

//多语言
func NBStrLocalizable(key: String) -> String {
    
    return NSLocalizedString(key, comment: "comment")
    
}

//系统语言
func language() -> String {
    
    let langFirstFromLocale:String = Locale.preferredLanguages.first!
    
    return langFirstFromLocale
}

//中文
func isChinese () -> Bool {
    
    if language().hasPrefix("zh") {
        
        return true
    
    }
    
    return false
}

//英文
func isEnglish () -> Bool {
    
    if language().hasPrefix("en") {
        
        return true
        
    }
    
    return false
}

//法语
func isFrancais () -> Bool {
    
    if language().hasPrefix("fr") {
        
        return true
        
    }
    
    return false
}

//日语
func isJapanese () -> Bool {
    
    if language().hasPrefix("ja") {
        
        return true
        
    }
    
    return false
}

//阿拉伯语
func isArabic () -> Bool {
    
    if language().hasPrefix("ar") {
        
        return true
        
    }
    
    return false
}

//韩语
func isKorean () -> Bool {
    
    if language().hasPrefix("ko") {
        
        return true
        
    }
    
    return false
}

public enum NBTextAlignment : Int {
    
    case left // Visually left aligned
    
    case center // Visually centered
    
    case right // Visually right aligned
    
    case justified // Fully-justified. The last line in a paragraph is natural-aligned.
    
    case natural // Indicates the default alignment for script
}

public enum NBLineBreakMode : Int {
    
    case wordWrapping // Wrap at word boundaries, default
    
    case charWrapping // Wrap at character boundaries
    
    case clipping // Simply clip
    
    case truncatingHead // Truncate at head of line: "...wxyz"
    
    case truncatingTail // Truncate at tail of line: "abcd..."
    
    case truncatingMiddle // Truncate middle of line:  "ab...yz"
    
}

//UILabel
func labelWithFrame(frame: CGRect,title: String, color: UIColor, fontName: String?, fontSize:CGFloat, textAlignment: NBTextAlignment, lineBreakMode: NBLineBreakMode) -> UILabel {
    
    let label = UILabel.init()
    
    label.frame = frame
    
    label.text = title
    
    label.textColor = color
    
    label.backgroundColor = UIColor.clear
    
    label.numberOfLines = 0
    
    if fontName == "D" {
        
        label.font = UIFont.init(name: "DINCond-Medium", size: fontSize)
        
    } else if fontName == nil {
        
        label.font = UIFont.systemFont(ofSize: fontSize)
        
    } else {
        
        label.font = UIFont.init(name: fontName!, size: fontSize)
        
    }
    
    switch textAlignment {
    
    case NBTextAlignment.left:
    
        label.textAlignment = NSTextAlignment.left
    
    case NBTextAlignment.right:
    
        label.textAlignment = NSTextAlignment.right
    
    case NBTextAlignment.center:
        
        label.textAlignment = NSTextAlignment.center
        
    case NBTextAlignment.justified:
        
        label.textAlignment = NSTextAlignment.justified
        
    case NBTextAlignment.natural:
        
        label.textAlignment = NSTextAlignment.natural
        
    }
    
    switch lineBreakMode {
        
    case NBLineBreakMode.wordWrapping:
        
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        
    case NBLineBreakMode.charWrapping:
        
        label.lineBreakMode = NSLineBreakMode.byCharWrapping
        
    case NBLineBreakMode.clipping:
        
        label.lineBreakMode = NSLineBreakMode.byClipping
        
    case NBLineBreakMode.truncatingHead:
        
        label.lineBreakMode = NSLineBreakMode.byTruncatingHead
        
    case NBLineBreakMode.truncatingTail:
        
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
    case NBLineBreakMode.truncatingMiddle:
        
        label.lineBreakMode = NSLineBreakMode.byTruncatingMiddle

    }
    return label
  
}

//带背景图片的按钮
func buttonWithImageFrame(frame: CGRect, imageName: String, tag: NSInteger, target: AnyObject,action: Selector) -> UIButton{
    
    let button = UIButton.init()
    
    button.frame = frame
    
    button.backgroundColor = UIColor.clear
    
    let image = UIImage.init(named: imageName)
    
    button.setBackgroundImage(image, for: .normal)
    
    button.tag = tag
    
    button.addTarget(target, action: action, for: .touchUpInside)
    
    return button
}

//按钮
func buttonWithTitleFrame(frame: CGRect, title: String, titleColor: UIColor, backgroundColor: UIColor, cornerRadius: CGFloat,tag: NSInteger, target: AnyObject, action: Selector) -> UIButton {
    
    let button = UIButton.init()
    
    button.frame = frame
    
    button.setTitle(title, for: .normal)
    
    button.setTitleColor(titleColor, for: .normal)
    
    button.backgroundColor = backgroundColor
    
    if cornerRadius > 0 {
        
        button.layer.cornerRadius = cornerRadius
        
    }
    
    button.tag = tag
    
    button.addTarget(target, action: action, for: .touchUpInside)
    
    return button
    
}

//输入文本框
func textFieldWithFrame(frame: CGRect,placeHolder: String,isSecure: Bool,delegate: UITextFieldDelegate?) -> UITextField {
    
    let textField = UITextField.init()
    
    textField.frame = frame
    
    textField.placeholder = placeHolder
    
    textField.clearButtonMode = UITextFieldViewMode.whileEditing
    
    textField.borderStyle = UITextBorderStyle.none
    
    textField.backgroundColor = UIColorFromRGB(rgbValue: 0xffffff)

    textField.layer.borderColor = UIColorFromRGB(rgbValue: 0xd3d3d3).cgColor
    
    textField.layer.borderWidth = 0.5
    
    textField.layer.cornerRadius = 8

    textField.font = UIFont.systemFont(ofSize: 14.0)
    
    textField.textColor = UIColor.black

    textField.isSecureTextEntry = isSecure
    
    textField.delegate = delegate
    
    let v = UIView.init()
    
    v.frame = CGRect.init(x: 0, y: 0, width: 16, height: 40)
    
    v.backgroundColor = UIColor.clear
    
    textField.leftView = v

    textField.leftViewMode = UITextFieldViewMode.always;
    
    return textField
}

//距离顶部(导航栏)的距离
func topHeight() -> CGFloat {
    
    return 64
    
}

//屏幕宽度
func screenWidth() -> CGFloat {

    return UIScreen.main.bounds.width
    
}

//屏幕高度
func screenHeight() -> CGFloat {
    
    return UIScreen.main.bounds.height
    
}

//16进制 grb 颜色
func UIColorFromRGB(rgbValue: Int) -> UIColor {
   
    return UIColor(
    
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    
    )
}

func RGB(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
    
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: alpha)
}

func setupRootVC(window: UIWindow) {
    
    var guidView: NBGuideVC!
    
    var rootViewController: UIViewController!
    
    if isNewVersion() && isChinese() {
        
        let coverImageNames = ["img_index_01txt","img_index_02txt", "img_index_03txt"]
        
        let backgroundImageNames = ["img_index_01bg","img_index_02bg", "img_index_03bg"]
        
        guidView = NBGuideVC(coverImageNames: coverImageNames, backgroundImageNames: backgroundImageNames)
        
        // Example 2
        //        var enterButton: UIButton? = UIButton()
        //        enterButton?.setBackgroundImage(UIImage(named: "bg_bar"), forState: UIControlState.Normal)
        //        self.introductionView = ZWIntroductionViewController(coverImageNames: coverImageNames, backgroundImageNames: backgroundImageNames, button: enterButton)
        
        guidView?.didSelectedEnter = {
            
            guidView?.view.removeFromSuperview()
            
            guidView = nil
            
            rootViewController = NBLoginVC()
            
            let navigationController = UINavigationController(rootViewController: rootViewController)
            
            //状态栏字体颜色 白色
            navigationController.navigationBar.barStyle = UIBarStyle.black
            
            window.rootViewController = navigationController
            
        }
        
        window.rootViewController = guidView
        
    } else {
        
        if userID().isEmpty {
            
           rootViewController = NBLoginVC()
            
        } else {
            
           rootViewController = NBSearchDeviceVC()
            
        }
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        //状态栏字体颜色 白色
        navigationController.navigationBar.barStyle = UIBarStyle.black
        
        window.rootViewController = navigationController
        
    }
    
}

func isNewVersion() -> Bool {

    let defau = UserDefaults.standard
    
    let lastVersion = defau.string(forKey: "kAppLastVersion")
    
    print("当前版本\(currentVersion());,前一版本\(lastVersion)")
    
    if (lastVersion == nil) || (currentVersion() > lastVersion!){
        
        defau.set(currentVersion(), forKey: "kAppLastVersion")
        
        return true
    }
    
    return false
}

func currentVersion() -> String {
    
    //Ninebot版本号version
    let version: String! = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    
    return version
    
}

func setRootVC(viewController: UIViewController) {
    

}
