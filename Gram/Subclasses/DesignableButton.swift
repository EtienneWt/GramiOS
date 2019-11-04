//
//  DesignableButton.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 23/06/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableButton: UIButton {
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor : UIColor? {
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    
}
