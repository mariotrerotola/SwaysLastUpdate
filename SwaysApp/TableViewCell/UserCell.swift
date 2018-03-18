//
//  UserCell.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/15/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    
    @IBOutlet weak var Photo: ImageArrondie!
    
    @IBOutlet weak var Namelbl: UILabel!
    
    @IBOutlet weak var MsgLbl: UILabel!
    
    
    var utilisateur: Utilisateur!
    var controller: SearchController?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configuration(_utilisateurss: Utilisateur, controller: SearchController) {
        self.utilisateur = _utilisateurss
        self.controller = controller
        self.Photo.telecharger(self.utilisateur.imageUrl)
        self.Namelbl.text = self.utilisateur.prenom + "" + self.utilisateur.nom
        self.MsgLbl.text = self.utilisateur.sport
        Donnees().obtenirChangementUtilisateur(id: self.utilisateur.id) { (key, value) -> (Void) in
            if let cle = key, let valeur = value {
                self.utilisateur.miseAJour(cle: cle, valeur: valeur)
                controller.TableView.reloadData()
            }
        }
    }
    
    
}
