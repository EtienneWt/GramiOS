//
//  DesignableTextField.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 22/06/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

@IBDesignable

class DesignableTextField: UITextField {
    @IBInspectable var cornerRadius : CGFloat = 0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var leftImage : UIImage? {
        didSet{
            updateView()
            
        }
    }
    @IBInspectable var leftpadding : CGFloat = 0 {
        didSet{
            updateView()
        }
    }

    func updateView(){
        
        if let image = leftImage {
            leftViewMode = .unlessEditing
            
            let imageView = UIImageView(frame: CGRect(x: leftpadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            
            
            var width = leftpadding + 20
            
            if borderStyle == BorderStyle.none || borderStyle == BorderStyle.line {
                width += 5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            leftView = view
        }else{
            leftViewMode = .never
        }
    }
}
