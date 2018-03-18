//
//  Utilisateur.swift
//  Sways
//
//  Created by Sullivan De Carli on 10/03/2018.
//  Copyright © 2017 Sullivan De Carli. All rights reserved.
//

import UIKit

class Utilisateur {
    
    private var _id: String!
    private var _prenom: String!
    private var _nom: String!
    private var _mail: String?
    private var _imageUrl: String?
    private var _sport: String?
    private var _age: String?

    var id: String {
        return _id
    }
    
    var prenom: String {
        return _prenom
    }
    
    var nom: String {
        return _nom
    }
    
    
    
    var mail: String? {
        return _mail
    }
    
    var imageUrl: String? {
        return _imageUrl
    }
    
    var sport: String {
        return _sport!
    }
    
    var age: String {
        return _age!
    }
    
    init(id: String, prenom: String, nom: String, mail: String?, url: String?, sport: String, age: String) {
        self._id = id
        self._prenom = prenom
        self._nom = nom
        self._mail = mail
        self._imageUrl = url
        self._sport = sport
        self._age = age
        
        
    }
    
    func miseAJour(cle: String, valeur: String) {
        switch cle {
        case "prenom": self._prenom = valeur
        case "nom": self._nom = valeur
        case "sport": self._sport = valeur
        case "age": self._age = valeur
        case "profilUrl": self._imageUrl = valeur
        default: break
        }
    }
    
    
    
    
    func editprofile(cle: String, valeur: String) {
        switch cle {
        case "prenom": self._prenom = valeur
        case "nom": self._nom = valeur
        case "sport": self._sport = valeur
        case "imageprofil": self._imageUrl = valeur
        default: break
            
            
        }
    }
    
    
    
    
    
    
    
    

}
