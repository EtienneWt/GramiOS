//
//  FavorisTableViewCell.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 26/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class FavorisTableViewCell: UITableViewCell {
    @IBOutlet weak var imageMenu: UIImageView!
    @IBOutlet weak var nomMenu: UILabel!
    @IBOutlet weak var prixMenu: UILabel!
    @IBOutlet weak var detailsMenu: UILabel!
    
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
