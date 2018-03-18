//
//  ChatController.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/17/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit

class ChatController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

    
    var monId: String!
    var partenaire: Utilisateur!
    var imagepartenaire: UIImage?
    var messagex = [Message]()
    var cellId = "MessagesCell"
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var Zonedesaisie: UIView!
    
    @IBOutlet weak var ZoneDeTexte: UITextView!
    
    @IBOutlet weak var CameraButton: UIButton!
    
    @IBOutlet weak var GaleryButton: UIButton!
    
    @IBOutlet weak var ZonedeTextConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var ZonedeTexteHauteur: NSLayoutConstraint!
    
    @IBOutlet weak var Zonedesaisieconstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CustomKeyboard()
        ZoneDeTexte.layer.cornerRadius = 15
        ZoneDeTexte.delegate = self
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        let nib = UINib(nibName: "Messagescell", bundle: nil)
        CollectionView.register(nib, forCellWithReuseIdentifier: cellId)
        CollectionView.keyboardDismissMode = .interactive
        
        
    }
        
        
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
        func miseEnPlace(id: String, utilisateur: Utilisateur, image: UIImage) {
        self.monId = id
        self.partenaire = utilisateur
        self.imagepartenaire = image
            
        CollectionView.delegate = self
        CollectionView.dataSource = self
        let nib = UINib(nibName: "MessageCell", bundle: nil)
        title = partenaire.prenom
            
        observerMessages()
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messagex.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessagesCell
        cell.configurer(monId: monId, message: messagex[indexPath.row], image: imagepartenaire)
        return cell
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        CollectionView.collectionViewLayout.invalidateLayout()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var hauteur: CGFloat = 60
        let largeur = collectionView.frame.width
        
        let message = messagex[indexPath.row]
        if let texte = message.texte, texte != "" {
            hauteur += texte.hauteur(largeur: largeur, font: UIFont.systemFont(ofSize: 17))
        }
        
        if let haut = message.hauteur, let large = message.largeur {
            hauteur += CGFloat(haut / large * 250)
        }
        
        return CGSize(width: largeur, height: hauteur)
    }
    
    
    func observerMessages() {
        Donnees().recevoirMessages(from: monId, to: partenaire.id) { (msg) -> (Void) in
            if let message = msg {
                self.messagex.append(message)
                self.trierMessages()
            }
        }
        
        Donnees().recevoirMessages(from: partenaire.id, to: monId) { (msg) -> (Void) in
            if let message = msg {
                self.messagex.append(message)
                self.trierMessages()
            }
        }
        
    }
    
    func trierMessages() {
        messagex = messagex.sorted(by: { $0.date < $1.date })
        DispatchQueue.main.async {
            self.CollectionView.reloadData()
            let indexPath = IndexPath(item: self.messagex.count - 1, section: 0)
            self.CollectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
        }
    }
    
    
    
    
    
    
    
}

    

    
    
    

