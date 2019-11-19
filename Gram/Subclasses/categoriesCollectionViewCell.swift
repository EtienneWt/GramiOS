//
//  categoriesCollectionViewCell.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 28/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class categoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCategorie: UIImageView!
    
    @IBOutlet weak var labelCategorie: UILabel!

    @IBOutlet weak var menuButton: UIButton!
    
    func setCategorie(categorie : Category) {
         labelCategorie.text = categorie.name
        let fullURL = URL(string : "http://localhost:3000/images/categories/" + categorie.imageID + ".png")!
        imageCategorie.af_setImage(withURL: fullURL )
    }

    @IBAction func showMenu(_ sender:Any)  {
            addButtonTapAction?()
        }

        var addButtonTapAction : (()->())?
    
}

