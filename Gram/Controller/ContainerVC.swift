//
//  ContainerVC.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 11/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var menuisHidden : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(toggleMenu),
                                               name: NSNotification.Name("ToggleMenu"),
                                               object: nil)
                                               
       
        
    }
    @objc func toggleMenu() {
        
        
        if menuisHidden{
            sideMenuConstraint.constant = 0
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
            
        }else{
            sideMenuConstraint.constant = -260
            UIView.animate(withDuration: 0.3){
                self.view.layoutIfNeeded()
            }
            
        }
        menuisHidden = !menuisHidden
    }
}
