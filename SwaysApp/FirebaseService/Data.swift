//
//  Donnees.swift
//  Sways
//
//  Created by Sullivan De Carli on 10/03/2018.
//  Copyright © 2017 Sullivan De Carli. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class Donnees {
    
    func obtenirUtilisateurSpecifique(id: String, completion: UtilisateurCompletion?) {
        let ref = references().Databaseuserspecifique(id: id)
        ref.observe(.value, with: { (snapshot) in
            if let dict = snapshot.value as? Dictionary<String, AnyObject> {
                let utilisateur = self.convertirDictEnUser(cle: snapshot.key, dict: dict)
                completion?(utilisateur)
            } else {
                print("Erreur")
                completion?(nil)
            }
        })
    }
    
    
    func obtainall(id: String, completion: UtilisateurCompletion?) {
        
        
        let ref = references().databaseuser
        ref.observe(.childAdded) { (snapchot) in
            if let dict = snapchot.value as? Dictionary<String, AnyObject>, snapchot.key != id {
                let utilisateur = self.convertirDictEnUser(cle: snapchot.key, dict: dict)
                completion?(utilisateur)
                
            } else {
                completion?(nil)
                
            }
        }
    }
    
    
    
    
    
    func obtenirChangementUtilisateur(id: String, completion: ChangementCompletion?) {
        let ref = references().databaseUtilisateurSpecifique(id: id)
        ref.observe(.childChanged) { (snapshot) in
            if let valeur = snapshot.value as? String {
                completion?(snapshot.key, valeur)
            } else {
                completion?(nil, nil)
            }
        }
    }
    
    
    func convertirDictEnUser(cle: String, dict: Dictionary<String, AnyObject>) -> Utilisateur?{
        guard let prenom = dict["prenom"] as? String else { return nil}
        guard let nom = dict["nom"] as? String else { return nil}
        guard  let sport = dict["sport"] as? String else { return nil }
        guard let age = dict["age"] as? String else { return nil }
        let mail = dict["mail"] as? String
        let imageUrl = dict["profilUrl"] as? String
        let utilisateur = Utilisateur(id: cle, prenom: prenom, nom: nom, mail: mail, url: imageUrl, sport: sport, age: age)
        return utilisateur
    }
    
    
    func convertirDictEnMessage(cle: String, dict: Dictionary<String, AnyObject>) -> Message? {
        guard let from = dict["from"] as? String else { return nil}
        guard let to = dict["to"] as? String else { return nil}
        guard let date = dict["date"] as? Double else { return nil}
        let texte = dict["texte"] as? String
        let imageUrl = dict["imageUrl"] as? String
        let hauteur = dict["hauteur"] as? Double
        let largeur = dict["largeur"] as? Double
        let message = Message(id: cle, from: from, to: to, date: date, texte: texte, imageUrl: imageUrl, hauteur: hauteur, largeur: largeur)
        return message
    }
    
    
    
    
    
    func envoyerMessage(from: String, to: String, valeurs: Dictionary<String, AnyObject> ) {
        let ref = references().databaseMessageEnvoi(from: from, to: to)
        ref.childByAutoId().updateChildValues(valeurs)
        
        let refFrom = references().databaseAmiSpecifique(from: from, to: to)
        refFrom.updateChildValues(valeurs)
        
        let refTo = references().databaseAmiSpecifique(from: to, to: from)
        refTo.updateChildValues(valeurs)
    }
    
    
    
    func recevoirMessages(from: String, to: String, completion: MessageCompletion?) {
        let ref = references().databaseMessageEnvoi(from: from, to: to)
        ref.observe(.childAdded) { (snapshot) in
            if let dict = snapshot.value as? Dictionary<String, AnyObject> {
                completion?(self.convertirDictEnMessage(cle: snapshot.key, dict: dict))
            }
        }
    }
    
    
    
    func derniersMessages(id: String, completion: DernierMessageCompletion?) {
        let ref = references().databaseMesAmis(id: id)
        ref.observe(.childAdded) { (snapshot) in
            print(snapshot)
            guard let dict = snapshot.value as? Dictionary<String, AnyObject> else { return }
            guard let date = dict["date"] as? Double else  { return }
            let texte = dict["texte"] as? String
            self.obtenirUtilisateurSpecifique(id: snapshot.key, completion: { (user) -> (Void) in
                if let utilisateur = user {
                    print(utilisateur.id)
                    completion?(DernierMessage(date: date, texte: texte, utilisateur: utilisateur))
                } else {
                    completion?(nil)
                }
            })
        }
    }
    
    
    
    func statut(bool: Bool) {
        if let id = Auth.auth().currentUser?.uid {
            let ref = references().databaseStatut(id: id)
            let dict: Dictionary<String, AnyObject> = [
                "online": bool as AnyObject,
                "dernier": Date().timeIntervalSince1970 as AnyObject
            ]
            ref.updateChildValues(dict)
        }
        
    }
   
}









