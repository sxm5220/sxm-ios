//
//  NBLoginVC.swift
//  Ninebot
//
//  Created by 宋晓明 on 16/8/16.
//  Copyright © 2016年 sxm. All rights reserved.
//

import UIKit

class NBLoginVC: NBBaseVC {
    
    var userNameField: UITextField!
    var passWordField: UITextField!
    
    var showPassWordButton: UIButton!
    var loginButton: UIButton!
    var registerButton: UIButton!
    var findPassWordButton: UIButton!
    var fastLoginButton: UIButton!
    var facebookLoginButton: UIButton!
    var QQLoginButton: UIButton!
    var WeiXinLoginButton: UIButton!
    var XiaoMiLoginButton: UIButton!
    
    var logintitleLabel: UILabel!
    
    var scrollView: UIScrollView!
    
    var permissionsArrary: NSArray!
    
    let fieldHeight: CGFloat = 45.0
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func hideKeyBoard() {
        
        _ = findFirstResponder(view: self.view).resignFirstResponder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = nb_s_login
    
        view.backgroundColor = RGB(r: 246.0, g: 246.0, b: 246.0, alpha: 1.0)

        permissionsArrary = ["get_user_info", "get_simple_userinfo", "add_t"]
        
        view.addSubview(self.NBScrollView())
    }
    
    func NBScrollView() -> UIScrollView {
        
        if (self.scrollView == nil) {
        
            let btnColor = RGB(r: 39, g: 39, b: 39, alpha: 1.0)
            
            self.scrollView = UIScrollView.init()
            
            self.scrollView.frame = CGRect.init(x: 0, y: 0, width: screenWidth(), height: screenHeight())
            
            self.scrollView.contentSize = CGSize.init(width: 0, height: screenHeight() - 64)
            
            self.scrollView.showsVerticalScrollIndicator = false
            
            self.scrollView.showsHorizontalScrollIndicator = false
            
            self.scrollView.backgroundColor = UIColorFromRGB(rgbValue: 0xf8f8f8)
        
            self.userNameField = textFieldWithFrame(frame: CGRect.init(x: 10, y: 10, width: screenWidth() - 20, height: fieldHeight),
                                               placeHolder: nb_s_inPutName,
                                               isSecure: false,
                                               delegate: self)
            
            self.userNameField.addTarget(self, action: #selector(textFieldChange(textField:)), for: .editingChanged)
            
            self.scrollView.addSubview(self.userNameField)
            
            self.passWordField = textFieldWithFrame(frame: CGRect.init(x: 10, y: self.userNameField.frame.maxY + 10, width: self.userNameField.bounds.size.width, height: fieldHeight),
                                               placeHolder: nb_s_inputPwd,
                                               isSecure: true,
                                               delegate: self)
            
            self.passWordField.addTarget(self, action: #selector(textFieldChange(textField:)), for: .editingChanged)
            
            self.scrollView.addSubview(self.passWordField)
            
            showPassWordButton = buttonWithImageFrame(frame: CGRect.init(x: screenWidth() - 52, y: self.userNameField.frame.maxY + 11, width: 35, height: fieldHeight - 2), imageName: "register_hide", tag: 98, target: self, action: #selector(btnClickAction(sender:)))
            
            showPassWordButton.setImage(UIImage.init(named: "register_show"), for: .selected)

            if isArabic() {
                
                showPassWordButton.frame = CGRect.init(x: 20, y: 11 + (fieldHeight + 10)*1, width:35 , height: fieldHeight - 2)
            }
            
            showPassWordButton.backgroundColor = UIColor.white
            
            self.scrollView.addSubview(showPassWordButton)
            
            
            registerButton = buttonWithTitleFrame(frame: CGRect.init(x: screenWidth() - 100 - 10, y: self.passWordField.frame.maxY + 10, width: 100, height: 40), title: nb_s_userRegister, titleColor: btnColor, backgroundColor: UIColor.clear, cornerRadius: 0, tag: 100, target: self, action: #selector(btnClickAction(sender:)))
            
            registerButton.setAttributedTitle(attributedTitle(str: nb_s_userRegister), for: .normal)
            
            registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            
            registerButton.contentHorizontalAlignment = .right
            
            self.scrollView.addSubview(registerButton)
            
        
            findPassWordButton = buttonWithTitleFrame(frame: CGRect.init(x: 10, y: self.passWordField.frame.maxY + 10, width: 100, height: 40), title: nb_s_forgetPwd, titleColor: btnColor, backgroundColor: UIColor.clear, cornerRadius: 0, tag: 99, target: self, action: #selector(btnClickAction(sender:)))
            
            findPassWordButton.setAttributedTitle(attributedTitle(str: nb_s_forgetPwd), for: .normal)

            findPassWordButton.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            
            findPassWordButton.contentHorizontalAlignment = .left
            
            self.scrollView.addSubview(findPassWordButton)
    
            let loginCGRect = CGRect.init(x: 10.0, y: findPassWordButton.frame.maxY + 10 , width: screenWidth() - 20.0, height: fieldHeight)
            
            loginButton = buttonWithTitleFrame(frame: loginCGRect, title: nb_s_login, titleColor: UIColor.white, backgroundColor: UIColorFromRGB(rgbValue: 0x3ec234),cornerRadius:CGFloat(fieldHeight / 2.0), tag: 101, target: self, action: #selector(btnClickAction(sender:)))
            
            loginButton.alpha = 0.5
            
            loginButton.isUserInteractionEnabled = false
            
            loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            self.scrollView.addSubview(loginButton)
            
            
            let fastLoginCGRect = CGRect.init(x: 10, y: loginButton.frame.maxY + 10, width: loginButton.bounds.size.width, height: loginButton.bounds.size.height)
            //快速登陆按钮
            fastLoginButton = buttonWithTitleFrame(frame: fastLoginCGRect, title: nb_s_mobileLogin, titleColor: btnColor, backgroundColor: UIColor.white, cornerRadius: loginButton.bounds.size.height / 2, tag: 102, target: self, action: #selector(btnClickAction(sender:)))
            
            fastLoginButton.layer.borderWidth = 0.5
            
            fastLoginButton.layer.borderColor = UIColor.lightGray.cgColor
            
            fastLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            //Facebook登陆按钮
            
            let facebookLoginCGRect = CGRect.init(x: 10, y: loginButton.frame.maxY + 10, width: loginButton.bounds.size.width, height: loginButton.bounds.size.height)
            
            facebookLoginButton = buttonWithImageFrame(frame: facebookLoginCGRect, imageName: "facebook_login_btn", tag: 106, target: self, action: #selector(btnClickAction(sender:)))
            
            facebookLoginButton.setTitleColor(UIColor.white, for: .normal)
            
            facebookLoginButton.backgroundColor = UIColor.white
            
            facebookLoginButton.setTitle("Facebook Login", for: .normal)
            
            facebookLoginButton.layer.cornerRadius = loginButton.bounds.size.height / 2
            
            facebookLoginButton.layer.borderWidth = 0.5
            
            facebookLoginButton.layer.borderColor = UIColor.lightGray.cgColor
            
            facebookLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            
            //三方登陆
            let logintitleCGRect = CGRect.init(x: 0, y: 0, width: 90, height: 40)
            
            logintitleLabel = labelWithFrame(frame: logintitleCGRect, title: nb_s_loginTitle, color: UIColor.lightGray, fontName: nil, fontSize: 13, textAlignment: NBTextAlignment.center, lineBreakMode: NBLineBreakMode.wordWrapping)
            
            logintitleLabel.center = CGPoint.init(x: 10 + screenWidth() / 4 - screenWidth() / 4 / 2, y: screenHeight() - 100)
            
            //qq登陆按钮
            let QQLoginButtonCGRect = CGRect.init(x: 0, y: 0, width: 37, height: 37)
            
            QQLoginButton = buttonWithImageFrame(frame: QQLoginButtonCGRect, imageName: "qq_icon", tag: 103, target: self, action: #selector(btnClickAction(sender:)))
            
            QQLoginButton.setTitleColor(btnColor, for: .normal)
            
            QQLoginButton.center = CGPoint.init(x: screenWidth() / 4 * 2 - screenWidth() / 4 / 2, y: screenHeight() - 100)
            
            QQLoginButton.layer.cornerRadius = 15
            
            QQLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            //微信登陆按钮
            let WeiXinLoginButtonCGRect = CGRect.init(x: 0, y: 0, width: 37, height: 37)
            
            WeiXinLoginButton = buttonWithImageFrame(frame: WeiXinLoginButtonCGRect, imageName: "wxchat_icon", tag: 104, target: self, action: #selector(btnClickAction(sender:)))
            
            WeiXinLoginButton.setTitleColor(btnColor, for: .normal)
            
            WeiXinLoginButton.center = CGPoint.init(x: screenWidth() / 4 * 3 - screenWidth() / 4 / 2, y: screenHeight() - 100)
            
            WeiXinLoginButton.layer.cornerRadius = 15
            
            WeiXinLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            //小米登陆按钮
            let XiaoMiLoginButtonCGRect = CGRect.init(x: 0, y: 0, width: 37, height: 37)
            
            XiaoMiLoginButton = buttonWithImageFrame(frame: XiaoMiLoginButtonCGRect, imageName: "xiaomi_icon", tag: 105, target: self, action: #selector(btnClickAction(sender:)))
            
            XiaoMiLoginButton.setTitleColor(btnColor, for: .normal)
            
            XiaoMiLoginButton.center = CGPoint.init(x: screenWidth() / 4 * 4 - screenWidth() / 4 / 2, y: screenHeight() - 100)
            
            XiaoMiLoginButton.layer.cornerRadius = 15
            
            XiaoMiLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            
            if isChinese() { //只有中文中显示这些登陆方式
                
                self.scrollView.addSubview(fastLoginButton)
                
                self.scrollView.addSubview(XiaoMiLoginButton)
                
                self.scrollView.addSubview(logintitleLabel)
                
                self.scrollView.addSubview(QQLoginButton)
                
                self.scrollView.addSubview(WeiXinLoginButton)
                
            } else {
                
                self.scrollView.addSubview(facebookLoginButton)
                
            }
            
            
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(registerTapAction(sender:)))
            
          self.scrollView.addGestureRecognizer(tap)
            
        }

        return self.scrollView
    }
    
    func btnClickAction(sender: UIButton) {
        
        self.hideKeyBoard()
        
        switch sender.tag {
        
        case 98://显示密码
        
            self.passWordField.isSecureTextEntry = false
            
            showPassWordButton.isSelected = !showPassWordButton.isSelected
            
            self.passWordField.isSecureTextEntry = showPassWordButton.isSelected ? false : true

        case 99://找回密码
            
            self.navigationController?.pushViewController(NBFindPassWordVC(), animated: true)
            
        case 100://注册用户
            
            self.navigationController?.pushViewController(NBRegisterUserVC(), animated: true)
            
        case 101://登陆
            
            if (self.userNameField.text?.isEmpty)! {
                
                progressHUDShowErrorWithStatus(status: nb_s_userNameNil)
                
                return
            }
            
            if (self.passWordField.text?.isEmpty)! {
            
                progressHUDShowErrorWithStatus(status: nb_s_userPwdNoNil)
                
                return
            }
            
            
        
        default:
            break
        }
    }
    
    func registerTapAction(sender: AnyObject) {
        
        self.hideKeyBoard()
        
    }
    
    func keyboardShow(notification: NSNotification) {
        
        let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        
        let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double
        
        let responder = findFirstResponder(view: self.scrollView)
        
        
        UIView.animate(withDuration: duration, animations: {
            
            let frame = self.scrollView.convert(keyboardRect!, to: nil)
            
            self.scrollView.frame = CGRect.init(x: 0, y: 0, width: screenWidth(), height: screenHeight() - frame.size.height)
            
            let resF = responder.frame
            
            let resH = resF.origin.y + resF.size.height
            
            let scrollH = self.scrollView.frame.size.height + self.scrollView.contentOffset.y
            
            if resH > scrollH{
                
                self.scrollView.scrollRectToVisible(resF, animated: true)
                
            }
            
        });
        
    }
    
    func keyboardHidden(notification: NSNotification) {
        
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        
        UIView.animate(withDuration: duration) {
            
            self.scrollView.contentOffset = CGPoint.init(x: 0, y: 0)
            
            self.scrollView.frame = CGRect.init(x: 0, y: 0, width: screenWidth(), height: screenHeight())
            
        }
       
    }
    
    func textFieldChange(textField: UITextField) {
        
        if ((self.userNameField.text?.characters.count)! > 0 && (self.passWordField.text?.characters.count)! > 0) {
            
            loginButton.alpha = 1.0
            
            loginButton.isUserInteractionEnabled = true
            
        } else {
            
            loginButton.alpha = 0.5
            
            loginButton.isUserInteractionEnabled = false
            
        }
        
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        loginButton.alpha = 0.5
        
        loginButton.isUserInteractionEnabled = false
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
