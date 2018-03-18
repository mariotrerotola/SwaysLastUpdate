//
//  Utilisateur.swift
//  Sways
//
//  Created by Sullivan De Carli on 10/03/2018.
//  Copyright © 2017 Sullivan De Carli. All rights reserved.
//


import UIKit


extension ChatController: UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    
    
    
    func textViewDidChange(_ textView: UITextView) {
        if let texte = textView.text {
            changerTailleDeZoneDeSaisie(string: texte)
        } else {
            changerTailleDeZoneDeSaisie(string: "")
        }
        
        
    }
    
    
    
    func changerTailleDeZoneDeSaisie(string: String) {
        if string != "", ZonedeTexteHauteur.constant == 90 {
            miseAJourContrainte(contrainte: ZonedeTexteHauteur, constante: 8)
            cacherBoutons(bool: true)
        }
        if string == "", ZonedeTextConstraint.constant != 90 {
            miseAJourContrainte(contrainte: Zonedesaisieconstraint, constante: 90)
            cacherBoutons(bool: false)
        }
        
        let hauteur = string.hauteur(largeur: ZoneDeTexte.frame.width, font: UIFont.systemFont(ofSize: 17))
        if hauteur + 16 > 50 {
            miseAJourContrainte(contrainte: Zonedesaisieconstraint, constante: hauteur + 16)
            miseAJourContrainte(contrainte: ZonedeTexteHauteur, constante: hauteur)
        } else {
            miseAJourContrainte(contrainte: Zonedesaisieconstraint, constante: 50)
            miseAJourContrainte(contrainte: Zonedesaisieconstraint, constante: 50 - 16)
        }
    }
    
    func cacherBoutons(bool: Bool) {
        CameraButton.isHidden = bool
        GaleryButton.isHidden = bool
    }
    
    
    func miseAJourContrainte(contrainte: NSLayoutConstraint, constante: CGFloat) {
        UIView.animate(withDuration: 0.35) {
            contrainte.constant = constante
        }
    }
    
   
    
  
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    func envoyerSurFirebase(dict: Dictionary<String, AnyObject>) {
        let date: Double = Date().timeIntervalSince1970
        var valeurs = dict
        valeurs["from"] = monId as AnyObject
        valeurs["to"] = partenaire.id as AnyObject
        valeurs["date"] =  date as AnyObject
        //Envoyer Sur Firebase
        Donnees().envoyerMessage(from: monId, to: partenaire.id, valeurs: valeurs)
        changerTailleDeZoneDeSaisie(string: "")
        view.endEditing(true)
    }
    
    
    
    
    @IBAction func OkboutonAction(_ sender: Any) {
        if let texte = ZoneDeTexte.text, texte != "" {
            ZoneDeTexte.text = ""
            envoyerSurFirebase(dict: ["texte": texte as AnyObject])
            
        }
        
    }
    
    
    @IBAction func GalleryAction(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func CameraButtonAction(_ sender: Any) {
    }
    
    
    
}



















