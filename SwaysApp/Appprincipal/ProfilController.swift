//
//  ProfilController.swift
//  sauvegarde
//
//  Created by Sullivan De carli on 3/14/18.
//  Copyright © 2018 Sullivan De carli. All rights reserved.
//

import UIKit
import FirebaseAuth



class ProfilController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var Profilepicture: UIImageView!
    
    @IBOutlet weak var NameTF: UITextField!
    
    @IBOutlet weak var AgeTF: UITextField!
    
    @IBOutlet weak var SportTF: UITextField!
    
    
    @IBOutlet weak var FollowerTF: UITextField!
    @IBOutlet weak var FollowingTF: UITextField!
    
    
    
    
    
    
    var monId: String!
    var picker = UIImagePickerController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Profil"
        
        picker.delegate = self
        picker.allowsEditing = true
        
        Profilepicture.isUserInteractionEnabled = true
        Profilepicture.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(camera)))
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(keyboardin(notification:))))
            
            
        
        
        Donnees().obtenirUtilisateurSpecifique(id: monId) { (utilisateur) -> (Void) in
            
            if let user = utilisateur {
                
                self.NameTF.text = user.prenom
                self.AgeTF.text = user.age
                self.SportTF.text = user.sport
                self.Profilepicture.telecharger(user.imageUrl)
            }
        }
        
        
        func keyboardover() {
            view.endEditing(true)
        }
        
        
    }
    
    @objc func camera() {
        Popup.Showanaccess.camera(controller: self, picker: picker)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var image: UIImage?
        if let original = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image = original
        } else if let modify = info[UIImagePickerControllerEditedImage] as? UIImage {
            image = modify
        }
        picker.dismiss(animated: true, completion: nil)
        if let img = image {
            self.Profilepicture.image = img
            Photostorage().saveprofile(image: img, id: monId)
        }
    }
    
    
    @IBAction func LogOutAction(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
        } catch {
            Popup.Showanaccess.Simplemessage(self, message: "Error")
            return
        }
        
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func ModifyAction(_ sender: Any) {
        
        var dict = Dictionary<String, AnyObject>()
        if let name = NameTF.text, name != nil {
            dict["Name"] = name as AnyObject
        }
        if let Age = AgeTF.text, Age != nil {
            dict["Age"] = Age as AnyObject
        }
        
        if let Sport = SportTF.text, Sport != nil {
            dict["Sport"] = Sport as AnyObject
        }
        
        
        let ref = references().Databaseuserspecifique(id: monId)
        ref.updateChildValues(dict)
    }
    
}
