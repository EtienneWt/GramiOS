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
            accueilViewController.getCategories()
            sleep(1)
            let MainVC = segue.destination as! ContainerVC
            MainVC.prepareCategories = accueilViewController.Categories
            print("test")
            print(accueilViewController.Categories)
    }
    }

    static func getCategories() {
        let request = createCategoryRequest()
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data, error == nil {
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    let categories = try? JSONDecoder().decode([Category].self, from: data)
                    self.Categories = categories!
                    print(self.Categories)
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
