//
//  Popup.swift
//  Sways
//
//  Created by Sullivan De Carli on 10/03/2018.
//  Copyright © 2017 Sullivan De Carli. All rights reserved.
//

import UIKit

class Popup {
    
    static let Showanaccess = Popup()
    
    
    
    //Extension for the alert, ask for the user to acess to camera and library
    
    func camera(controller: UIViewController, picker: UIImagePickerController) {
        let popup = UIAlertController(title: "What do you want to use?", message: nil, preferredStyle: .alert)
        let photo = UIAlertAction(title: "Camera", style: .default) { (action) in
            picker.sourceType = .camera
            controller.present(picker, animated: true, completion: nil)
        }
        let gallerie = UIAlertAction(title: "Library", style: .default) { (action) in
            picker.sourceType = .photoLibrary
            controller.present(picker, animated: true, completion: nil)
        }
        let annuler = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        popup.addAction(photo)
        popup.addAction(gallerie)
        popup.addAction(annuler)
        controller.present(popup, animated: true, completion: nil)
        
        
        
     //   Extension for the error message when field are empty in registration 
        
        
    }
    
    func Simplemessage(_ controller: UIViewController, message: String) {
        let popup = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        popup.addAction(ok)
        controller.present(popup, animated: true, completion: nil)
    }
    
}
