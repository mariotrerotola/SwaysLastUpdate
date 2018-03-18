//
//  RoundView.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/9/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit

class RoundView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        PositionUI()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        PositionUI()
    }
    
    func PositionUI() {
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.clear.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 0.70
    }
    
    
    
}
