//
//  SwipeView.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 26/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class SwipeView: UIView {

    @IBOutlet weak var imageSwipe: UIImageView!
    @IBOutlet weak var nomSwipe: UILabel!
    @IBOutlet weak var detailsSwipe: UILabel!
    
    
    func setMenu(recipe : recipe) {
        let fullURL = URL(string : "http://localhost:3000/images/recipes_carousel/" + recipe.pictureID)!
        imageSwipe.af_setImage(withURL: fullURL)
        nomSwipe.text = recipe.name
        detailsSwipe.text = recipe.recipeDescription
    }
}
