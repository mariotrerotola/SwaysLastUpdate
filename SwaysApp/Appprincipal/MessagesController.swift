//
//  MessagesController.swift
//  sauvegarde
//
//  Created by Sullivan De carli on 3/14/18.
//  Copyright © 2018 Sullivan De carli. All rights reserved.
//

import UIKit

class MessagesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var TableViewMsg: UITableView!
    
    
    
    var monId: String!
    var utilisateur = [Utilisateur]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewMsg.delegate = self
        TableViewMsg.dataSource = self
        
        title = "Messages"
        
        func observe() {
            
            Donnees().derniersMessages(id: monId) { (dernier) -> (Void) in
                if let derniermessage = dernier {
                    self.derniersmessages.ap
                }
            }
            
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return utilisateur.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    
}
