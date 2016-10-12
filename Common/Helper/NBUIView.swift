//
//  NBUIView.swift
//  Ninebot
//
//  Created by 宋晓明 on 16/8/22.
//  Copyright © 2016年 sxm. All rights reserved.
//

import Foundation
import UIKit

func findFirstResponder(view: UIView) -> UIView {
    
    var firstResponder = UIView.init()
    
    if view.isFirstResponder {
        return view
    }
    let subViews = view.subviews
    
    for subView:UIView in subViews {
        
        firstResponder = findFirstResponder(view: subView)
        
        return firstResponder
        
    }
    
    return firstResponder
}

func hideKeyBoard(view: UIView) {
    
    _ = findFirstResponder(view: view).resignFirstResponder()
    
}

func addObserverKeyBoard(view: AnyObject, scrollView: UIScrollView) {
    
//    NotificationCenter.default.addObserver(view, selector: #selector(keyboardShow(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
//
//    NotificationCenter.default.addObserver(view, selector: #selector(keyboardHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
}

func keyboardShow(notification: NSNotification, scrollView: UIScrollView) {
    
    let keyboardRect = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
    
    let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! Double
    
    let responder = findFirstResponder(view: scrollView)
    
    UIView.animate(withDuration: duration, animations: {
        
        let frame = scrollView.convert(keyboardRect!, to: nil)
        
        scrollView.frame = CGRect.init(x: 0, y: 0, width: screenWidth(), height: screenHeight() - frame.size.height)
        
        let resF = responder.frame
        
        let resH = resF.origin.y + resF.size.height
        
        let scrollH = scrollView.frame.size.height + scrollView.contentOffset.y
        
        if resH > scrollH{
            
            scrollView.scrollRectToVisible(resF, animated: true)
            
        }
        
    });
    
}

func keyboardHidden(notification: NSNotification, scrollView: UIScrollView) {
    
    let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
    
    UIView.animate(withDuration: duration) {
        
        scrollView.contentOffset = CGPoint.init(x: 0, y: 0)
        
        scrollView.frame = CGRect.init(x: 0, y: 0, width: screenWidth(), height: screenHeight())
        
    }
    
}
