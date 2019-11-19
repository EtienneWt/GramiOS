//
//  ContainerVC.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 11/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    static var Categories: [Category]  = []
    var prepareCategories: [Category]  = []
    private static let categoryUrl = URL(string: "http://localhost:3000/category")!
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    var menuisHidden : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        ContainerVC.getCategories()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if(segue.identifier == "MainVCEmbedSegue"){
            ContainerVC.getCategories()
            let MainVC = segue.destination as! MainVC
            MainVC.prepareCategories = prepareCategories
            print(ContainerVC.Categories)
            print(MainVC.prepareCategories)
    }
    }

    static func getCategories() {
        let request = createCategoryRequest()
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data, error == nil {
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    ContainerVC.Categories = try! JSONDecoder().decode([Category].self, from: data)
                }
            }
        }
        task.resume()
    }

    private static func createCategoryRequest() -> URLRequest {
        var request = URLRequest(url: categoryUrl)
        request.httpMethod = "GET"

        return request
    }
}
