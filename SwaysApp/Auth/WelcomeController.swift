//
//  WelcomeController.swift
//  sauvegarde
//
//  Created by Sullivan De carli on 3/14/18.
//  Copyright © 2018 Sullivan De carli. All rights reserved.
//

import UIKit
import FirebaseAuth

class WelcomeController: UIViewController {
    
    
    
    @IBOutlet weak var LogIn: Round_Button!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    // function to get the user on the App if he has done the registration already.
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let id = Auth.auth().currentUser?.uid {
            
            // performSegue(withIdentifier: "TabBarCreation", sender: AnyObject.self)
            
            
            
        } else {
            print("an error occured")
        }
    }
    
    
    // Ho invertito il login e il sign up "nella logica"
    
    
    
    @IBAction func LogInAction(_ sender: Any) {
        
        let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "Maintabbar") as! WelcomeController
        self.present(tabBarController!, animated: true)
        
        
        
    }
    
    
    @IBAction func SignUp(_ sender: Any) {
        
        
        
        
    }
    
}
