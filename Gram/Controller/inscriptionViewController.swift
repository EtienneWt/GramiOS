//
//  inscriptionViewController.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 12/11/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class inscriptionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBackGesture(_ sender: Any) {
        self.performSegue(withIdentifier: "inscriptionControllerToFirstScreen", sender: sender)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
