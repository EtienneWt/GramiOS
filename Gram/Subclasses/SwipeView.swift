//
//  SwipeView.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 26/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class SwipeView: UIView {

    @IBOutlet weak var imageSwipe: UIImageView!
    @IBOutlet weak var nomSwipe: UILabel!
    @IBOutlet weak var detailsSwipe: UILabel!
    
    
    func setMenu(menu : modeleMenu) {
        imageSwipe.image = menu.image
        nomSwipe.text = menu.nom
        detailsSwipe.text = menu.details
    }
}
