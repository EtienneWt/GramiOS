//
//  accueilViewController.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 18/11/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class accueilViewController: UIViewController {
    
    static var Categories: [Category]  = []
    private static let categoryUrl = URL(string: "http://localhost:3000/category")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
       //  Do any additional setup after loading the view.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if(segue.identifier == "showMainVC"){
            let MainVC = segue.destination as! ContainerVC
            MainVC.prepareCategories = accueilViewController.Categories
    }
    }
}
