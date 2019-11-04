//
//  Menu.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 25/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//
import UIKit
class modeleMenu{
    var image : UIImage?
    var nom : String?
    var prix : String?
    var details : String?
    
    
    init(image: UIImage,nom: String,prix:String,details: String) {
        self.image = image
        self.nom = nom
        self.prix = prix
        self.details = details
    }
    
    init(image: UIImage, nom:String,details: String) {
        self.image = image
        self.nom = nom
        self.details = details
    }
    
}
