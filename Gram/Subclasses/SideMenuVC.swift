//
//  SideMenu.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 11/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class SideMenuVC: UITableViewController {
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch(indexPath.section) {
        case 3 : NotificationCenter.default.post(name : NSNotification.Name("Accueil"), object: nil)
            break
            case 4 : NotificationCenter.default.post(name : NSNotification.Name("Favoris"), object: nil)
            break
            case 5 : NotificationCenter.default.post(name : NSNotification.Name("Swipe"), object: nil)
            break
            case 6 : NotificationCenter.default.post(name : NSNotification.Name("Gram"), object: nil)
            break
            case 7 : NotificationCenter.default.post(name : NSNotification.Name("Profil"), object: nil)
            break
        
        default:
            break
        }
    

}
}
