//
//  Round Button.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/9/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit

class Round_Button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func ButtonUI() {
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowOpacity = 0.60
    }

}
