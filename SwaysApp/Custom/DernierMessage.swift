//
//  DernierMessage.swift
//  Sways
//
//  Created by Sullivan De Carli on 10/03/2018.
//  Copyright © 2017 Sullivan De Carli. All rights reserved.
//

import Foundation

class DernierMessage {
    
    private var _date: Double!
    private var _texte: String?
    private var _utilisateur: Utilisateur!
    
    var date: Double {
        return _date
    }
    
    var texte: String? {
        return _texte
    }
    
    var utilisateur: Utilisateur {
        return _utilisateur
    }
    
    init(date: Double, texte: String?, utilisateur: Utilisateur) {
        self._date = date
        self._texte = texte
        self._utilisateur = utilisateur
    }
    
    func miseAJour(cle: String, valeur: AnyObject) {
        if cle == "texte", let string = valeur as? String {
            self._texte = string
        }
        if cle == "date", let double = valeur as? Double {
            self._date = double
        }
    }
}
