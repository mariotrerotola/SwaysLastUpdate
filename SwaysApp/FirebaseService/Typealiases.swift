//
//  Typealiases.swift
//  Sways
//
//  Created by Sullivan De Carli on 10/03/2018.
//  Copyright © 2017 Sullivan De Carli. All rights reserved.
//

import UIKit


typealias UtilisateurCompletion = (_ utilisateur: Utilisateur?) -> (Void)
typealias ChangementCompletion = (_ cle: String?, _ valeur: String?) -> (Void)
typealias MessageCompletion = (_ message: Message?) -> (Void)
typealias DernierMessageCompletion = (_ dernier: DernierMessage?) -> (Void)
