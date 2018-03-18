//
//  Reference.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/9/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class references {
    //Database
    let databaseFirebase = Database.database().reference()
    
    var databaseuser: DatabaseReference {
        return databaseFirebase.child("utilisateur")
        
    }
    
    func Databaseuserspecifique(id: String) ->
        DatabaseReference {
            return databaseuser.child(id)
    }
    
    var databaseUtilisateurs: DatabaseReference {
        return databaseuser.child("utilisateurs")
    }
    
    
    
    
    
    func databaseUtilisateurSpecifique(id: String) -> DatabaseReference {
        return databaseUtilisateurs.child(id)
    }
    
    func databasedernierMessageUtilisateur(id: String) -> DatabaseReference {
        return databaseuser.child(id).child("friends")
    }
    
    
    var databaseMessages: DatabaseReference {
        return databaseFirebase.child("messages")
    }
    
    func databaseMessageEnvoi(from: String, to: String) -> DatabaseReference {
        return databaseMessages.child(from).child(to)
    }
    
    
    
    
    
    var databaseAmis: DatabaseReference {
        return databaseFirebase.child("amis")
    }
    
    func databaseMesAmis(id: String) -> DatabaseReference {
        return databaseAmis.child(id)
    }
    
    
    func databaseAmiSpecifique(from: String, to: String) -> DatabaseReference {
        return databaseAmis.child(from).child(to)
    }
    
    
    
    func databaseStatut(id: String) -> DatabaseReference {
        return databaseUtilisateurs.child(id).child("statut")
    }
    
    
    //Stockage
    
    let stockageBase = Storage.storage().reference()
    var stockageProfile: StorageReference {
        return stockageBase.child("Profile")
        
        
    }
    
    
    func stockageprofilespecifique(id: String) -> StorageReference {
        return stockageProfile.child(id)
    }
    
    
    
    
}









