//
//  categoriesCollectionViewCell.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 28/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class categoriesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageCategorie: UIImageView!
    
    @IBOutlet weak var labelCategorie: UILabel!


    func setCategorie(categorie : Categories) {
        imageCategorie.image = categorie.imageCategorie
        labelCategorie.text = categorie.nomCategorie
    }


}


