//
//  TabBarCreation.swift
//  SwaysApp
//
//  Created by Sullivan De carli on 3/10/18.
//  Copyright © 2018 Mario Trerotola. All rights reserved.
//

import UIKit

class TabBarCreation: UITabBarController {

    var id: String! 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
        func setup(id: String) {
            self.id = id
            
            let Home = HomeController()
            Home.monId = id
            let HomeNav = UINavigationController(rootViewController: Home)
            HomeNav.title = "Home"
            HomeNav.tabBarItem.image = #imageLiteral(resourceName: "Home-icon")
            
            let themessage = MessagesController()
            themessage.monId = id
            let lastNav = UINavigationController(rootViewController: themessage)
            lastNav.title = "message"
            lastNav.tabBarItem.image = #imageLiteral(resourceName: "chat-icon")
            
            let search = SearchController()
            search.monId = id
            let searchnav = UINavigationController(rootViewController: search)
            searchnav.title = "Players"
            searchnav.tabBarItem.image = #imageLiteral(resourceName: "search-icon")
            
            let centers = CentersController()
            centers.monId = id
            let centersNav = UINavigationController(rootViewController: centers)
            centersNav.title = "centers"
            centersNav.tabBarItem.image = #imageLiteral(resourceName: "icon-geolocalisation")
        
            let Profil = ProfilController()
            Profil.monId = id
            let ProfilNav = UINavigationController(rootViewController: Profil)
            ProfilNav.title = "Profil"
            ProfilNav.tabBarItem.image = #imageLiteral(resourceName: "Profile-icon")
            
            
            
            viewControllers = [searchnav, centersNav, HomeNav, lastNav, ProfilNav]
            tabBar.clipsToBounds = true
            
       
    }

    
    

}
