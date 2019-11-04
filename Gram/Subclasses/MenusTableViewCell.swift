//
//  MenusTableViewCell.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 25/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

var isReadable : Bool = false
var detailsHeight : CGFloat = 0

class MenusTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageMenu: UIImageView!
    
    @IBOutlet weak var nomMenu: UILabel!
    
    @IBOutlet weak var prixMenu: UILabel!
    
    @IBOutlet weak var detailsMenu: UILabel!
    
    
    @IBOutlet weak var bottomAjouter: NSLayoutConstraint!
    
    func setMenu(menu : modeleMenu) {
        imageMenu.image = menu.image
        nomMenu.text = menu.nom
        prixMenu.text = menu.prix
        detailsMenu.text = menu.details
    }

    @IBAction func ExpandDetails(_ sender: Any) {
        if(isReadable){
            
            detailsMenu.isHidden = true
        }else{
            detailsMenu.isHidden = false
            
        }
        isReadable = !isReadable
    }
    
}
