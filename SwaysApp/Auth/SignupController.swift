//
//  SignupController.swift
//  sauvegarde
//
//  Created by Sullivan De carli on 3/14/18.
//  Copyright © 2018 Sullivan De carli. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase




class SignUpController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var Picture: UIImageView!
    
    @IBOutlet weak var Nametextfield: UITextField!
    
    @IBOutlet weak var SurnameTextField: UITextField!
    
    @IBOutlet weak var MailtextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SporttextField: UITextField!
    
    @IBOutlet weak var AgeTextField: UITextField!
    
    
    var picker = UIImagePickerController()
    var Image: UIImage?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomKeyboard()
        picker.delegate = self
        picker.allowsEditing = true
        Picture.isUserInteractionEnabled = true
        Picture.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(asklibrary)))
        
        Nametextfield.delegate = self
        SurnameTextField.delegate = self
        MailtextField.delegate = self
        PasswordTextField.delegate = self
        SporttextField.delegate = self
        AgeTextField.delegate = self
        
        
        
        
        
        
    }
    
    
    @objc func asklibrary() {
        
        Popup.Showanaccess.camera(controller: self, picker: self.picker)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let imageChangee = info[UIImagePickerControllerEditedImage] as? UIImage {
            Image = imageChangee
            Picture.image = imageChangee
        }
        
        if let OriginImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            Image = OriginImage
            Picture.image = OriginImage
        }
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    // Return Keyboard when you press go
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func uneerreur(string: String) {
        view.supprimmerActivity()
        Popup.Showanaccess.Simplemessage(self, message: string)
    }
    
    
    func register() {
        
        guard let Name = Nametextfield.text, Name != "" else {
            uneerreur(string: "Error, You need the give all infos")
            
            return
        }
        
        guard let Surname = SurnameTextField.text, Surname != "" else {
            uneerreur(string: "Error, You need the give all infos")
            return
        }
        
        guard let Mail = MailtextField.text, Mail != "" else {
            uneerreur(string: "Error, You need the give all infos")
            return
        }
        
        guard let Password = PasswordTextField.text, Password != "" else {
            uneerreur(string: "Error, You need the give all infos")
            return
        }
        
        guard let Sport = SporttextField.text, Sport != "" else {
            uneerreur(string: "Error, You need the give all infos")
            return
        }
        
        guard let Age = AgeTextField.text, Age != "" else {
            uneerreur(string: "Error, You need the give all infos")
            return
        }
        
        //auth firebase with email and password
        
        Auth.auth().createUser(withEmail: Mail, password: Password) { (user, anerror) in
            if let errordetected = anerror {
                self.uneerreur(string: errordetected.localizedDescription)
            } else {
                if let id = user?.uid {
                    let dict: Dictionary<String, AnyObject> = [
                        "Name": Name as AnyObject,
                        "Surname": Surname as AnyObject,
                        "Mail": Mail as AnyObject,
                        "Sport": Sport as AnyObject,
                        "Age": Age as AnyObject
                    ]
                    
                    
                    let reference = references().Databaseuserspecifique(id: id)
                    reference.updateChildValues(dict, withCompletionBlock: { (error, references) in
                        if let oneerror = error {
                            self.uneerreur(string: error!.localizedDescription)
                        } else {
                            // func to registred an image (optionel) !
                            Photostorage().saveprofile(image: self.Image, id: id)
                            let tab = TabBarCreation()
                            tab.setup(id: id)
                            self.view.supprimmerActivity()
                            self.present(tab, animated: true, completion: nil)
                        }
                    })
                    
                } else {
                    self.uneerreur(string: "An error occured")
                }
            }
        }
        
        
        
        
    }
    
    
    @IBAction func registrationAction(_ sender: Any) {
        
        view.creerActivity()
        
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (time) in
            self.register()
        }
        
        
        
    }
    
    @IBAction func CancelAction(_ sender: Any) {
        view.endEditing(true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
