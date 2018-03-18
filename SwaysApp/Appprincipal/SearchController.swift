//
//  SearchController.swift
//  sauvegarde
//
//  Created by Sullivan De carli on 3/14/18.
//  Copyright © 2018 Sullivan De carli. All rights reserved.
//

import UIKit

class SearchController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    
    var monId: String!
    var utilisateurs = [Utilisateur]()
    var utilisateursfiltre = [Utilisateur]()
    let cellId = "Usercell"
    
    var enrecherche = false
    
    
    
    @IBOutlet weak var Search: UISearchBar!
    
    
    @IBOutlet weak var TableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Players"
        
        Search.delegate = self
        
        
        TableView.delegate = self
        TableView.dataSource = self
        TableView.tableFooterView = UIView() 
        
        let nib = UINib(nibName: "Usercell", bundle: nil)
        TableView.register(nib, forCellReuseIdentifier: cellId)
        observer()
    }
    
    
    func observer() {
        Donnees().obtainall(id: monId) { (utilisateur) -> (Void) in
            if let user = utilisateur {
                self.utilisateurs.append(user)
                self.TableView.reloadData()
                
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if enrecherche {
            return utilisateursfiltre.count
        }
        return utilisateurs.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! UserCell
        if enrecherche {
            cell.configuration(_utilisateurss: utilisateursfiltre[indexPath.row], controller: self)
        } else {
            cell.configuration(_utilisateurss: utilisateurs[indexPath.row], controller:  self)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserCell
        let controller = ChatController()
        if enrecherche {
            
            
        } else {
        
        }
        self.navigationController?.pushViewController(controller, animated: true)
        
       
    }
    
    
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            enrecherche = false
            view.endEditing(true)
        } else {
            enrecherche = true
            let minuscule = searchBar.text!.lowercased()
            utilisateursfiltre = utilisateurs.filter {
                return $0.nom.lowercased().range(of: minuscule) != nil || $0.prenom.lowercased().range(of: minuscule) != nil
            }
            
            
            
            
            
        }
        
        
        TableView.reloadData()
        
        
        
        
    }
    
    
    }

    


