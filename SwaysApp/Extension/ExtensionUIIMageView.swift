//
//  ExtensionUIIMageView.swift
//  Sways
//
//  Created by Sullivan De Carli on 10/12/2017.
//  Copyright © 2017 Sullivan De Carli. All rights reserved.
//

import UIKit
import SDWebImage


extension UIImageView {
    
    func telecharger(_ urlString: String?) {
        image = #imageLiteral(resourceName: "Superman-facebook.svg")
        guard let string = urlString else { return }
        guard let url = URL(string: string) else { return }
        sd_setImage(with: url, completed: nil)
    }
}
