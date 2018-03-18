//
//  MessagesCell.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/17/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit

class MessagesCell: UICollectionViewCell {

    
   
    
    @IBOutlet weak var ImageProfil: ImageArrondie!
    @IBOutlet weak var Bulle: UIView!
    @IBOutlet weak var DataLabel: UILabel!
    
    @IBOutlet weak var TextLabel: UILabel!
    
    @IBOutlet weak var ImageMessage: UIImageView!
    
    @IBOutlet var LargueurBulleContraint: NSLayoutConstraint!
    
    
    @IBOutlet var BulleLeftContraint: NSLayoutConstraint!
    
    
    @IBOutlet var BullerightContraint: NSLayoutConstraint!
    
    
    var message: Message!
    var monId: String!
    
    
    
    
    
    func configurer(monId: String, message: Message, image: UIImage?) {
        self.monId = monId
        self.message = message
        
        ImageProfil.image = #imageLiteral(resourceName: "Superman-facebook.svg")
        ImageProfil.isHidden = false
        ImageMessage.isHidden = true
        TextLabel.isHidden = true
        BulleLeftContraint.isActive = true
        BullerightContraint.isActive = true
        LargueurBulleContraint.constant = 200
        Bulle.layer.cornerRadius = 10
        
        
        
        
        if self.monId == self.message.from {
            ImageProfil.isHidden = true
            BulleLeftContraint.isActive = false
            Bulle.backgroundColor = BULLE_BLEUE
        } else {
            BullerightContraint.isActive = false
            Bulle.backgroundColor = BULLE_VERTE
            ImageProfil.image = image
            
        }
        
        
        if let texte = self.message.texte {
            TextLabel.isHidden = false
            TextLabel.text = texte
            let largeurDeTexte = texte.largeur(largeur: UIScreen.main.bounds.width - 100, font: UIFont.systemFont(ofSize: 17)) + 32
            if largeurDeTexte < 100 {
                LargueurBulleContraint.constant = 100
            } else {
                LargueurBulleContraint.constant = largeurDeTexte
            }
            
            
            DataLabel.text = message.date.dateLisiblePourMessage()
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    

}
