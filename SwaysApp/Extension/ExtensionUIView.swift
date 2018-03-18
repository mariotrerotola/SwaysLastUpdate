//
//  ExtensionUIView.swift
//  Sways
//
//  Created by Sullivan De Carli on 10/03/2018.
//  Copyright © 2017 Sullivan De Carli. All rights reserved.
//

import UIKit

extension UIView {
    
    func creerActivity() {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blur.frame = self.bounds
        blur.tag = 5
        addSubview(blur)
        
        let activity = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activity.center = self.center
        activity.tag = 6
        activity.color = .darkGray
        activity.startAnimating()
        addSubview(activity)
    }
    
    func supprimmerActivity() {
        for view in subviews {
            if view.tag == 5 {
                view.removeFromSuperview()
            }
            if view.tag == 6, let act = view as? UIActivityIndicatorView {
                act.stopAnimating()
                act.removeFromSuperview()
            }
        }
    }
    
    
}
