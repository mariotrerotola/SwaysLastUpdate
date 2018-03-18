//
//  ExtensionUIViewController.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/9/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit


extension UIViewController {
    
    func CustomKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardout), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardin), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyboardover)))
    }
    
    
    @objc func keyboardout(notification: Notification) {
        if let rectkeyboard = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, view.frame.minY == 0  {
            UIView.animate(withDuration: 0.25, animations: {
           self.view.frame.origin.y -= rectkeyboard.height})
        }
    }
    
    @objc func keyboardin(notification: Notification) {
        UIView.animate(withDuration: 0.25) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @objc func keyboardover() {
        view.endEditing(true)
    }
    
}






