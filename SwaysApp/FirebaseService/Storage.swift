//
//  Storage.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/10/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit
import FirebaseStorage




class Photostorage {
    
    func saveprofile(image: UIImage!, id: String) {
        
        
        guard let monimage = image else { return }
        guard let imagetransforme = UIImageJPEGRepresentation(monimage, 0.1) else { return }
        let reference = references().stockageprofilespecifique(id: id)
        reference.putData(imagetransforme, metadata: nil) { (meta, error) in
            if let erreur = error {
                
                print(erreur.localizedDescription)
            } else if let metaImageUrl = meta?.downloadURL()?.absoluteString  {
                let reference = references().Databaseuserspecifique(id: id)
                reference.updateChildValues(["ProfilUrl": metaImageUrl])
            }
        }
        
        
    }
    
    
    
}





