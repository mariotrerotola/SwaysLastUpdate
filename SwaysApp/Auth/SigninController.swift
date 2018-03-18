//
//  SigninController.swift
//  sauvegarde
//
//  Created by Sullivan De carli on 3/14/18.
//  Copyright © 2018 Sullivan De carli. All rights reserved.
//

import UIKit
import FirebaseAuth


class SigninController: UIViewController {
    
    
    @IBOutlet weak var MailTextFieldIn: UITextField!
    
    @IBOutlet weak var PasswordTextFieldIn: UITextField!
    
    @IBOutlet weak var Loginbutton: Round_Button!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomKeyboard()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func uneErreur(string: String) {
        view.supprimmerActivity()
        Popup.Showanaccess.Simplemessage(self, message: string)    }
    
    
    func identification() {
        guard let mail = MailTextFieldIn.text, mail != "" else {
            uneErreur(string: "Please enter an email adress")
            return
        }
        guard let password = PasswordTextFieldIn.text, password != "" else {
            uneErreur(string: "Please, enter a password")
            return
        }
        Auth.auth().signIn(withEmail: mail, password: password) { (user, error) in
            if let erreur = error {
                self.uneErreur(string: erreur.localizedDescription)
                
            } else if let id = user?.uid {
                self.view.supprimmerActivity()
                self.envoyerVersApp(id: id)
            } else {
                self.uneErreur(string: "Try again later")
                
            }
        }
        
    }
    
    
    
    
    
    
    @IBAction func LogInAction(_ sender: Any) {
        
        view.creerActivity()
        
        //view.endEditing(true)
        Timer.scheduledTimer(withTimeInterval: 0.6,
                             repeats: false) { (t) in
                                self.identification()
                                
                                
                                
        }
        
        
    }
    
    
    // per superare il welcome controller
    
    func envoyerVersApp(id: String) {
        let tab = TabBarCreation()
        tab.setup(id: id)
        Donnees().statut(bool: true)
        self.present(tab, animated: true, completion: nil)
    }
    
    
}
