//
//  SwipeViewController.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 26/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit
import Alamofire
class SwipeViewController: UIViewController {

    @IBOutlet var swipeCardView: SwipeView!
    var division: CGFloat!
    var compteur : Int = 0
    var categorie = ""
    var recipesURL = ""
    var recipesList: recipeList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        division = (view.frame.width/2) / 0.61
        var recipes = try? recipeList(fromURL : URL(string : recipesURL)!)
        recipesList = recipes
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    

     func getRecipes() {
        let request = createRecipesRequest()
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data, error == nil {
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    let categories = try? JSONDecoder().decode([recipe].self, from: data)
                    self.recipesList?.List = categories!
                }
            }
        }
        task.resume()
    }

    private func createRecipesRequest() -> URLRequest {
        let fullURL = URL(string: "http://localhost:3000/recipes/category/" + self.recipesURL)!
        var request = URLRequest(url: fullURL)
        request.httpMethod = "GET"

        return request
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/division)
        if sender.state == UIGestureRecognizer.State.ended{
            
            if card.center.x < 75{
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x - 200, y : card.center.y - 75)
                    self.Swiped(card : card)
                    })
            }else if card.center.x > (view.frame.width-75){
                
                UIView.animate(withDuration: 0.3, animations: {
                    card.center = CGPoint(x: card.center.x + 200, y : card.center.y - 75)
                    self.Swiped(card : card)
                })
            }else{
            
                UIView.animate(withDuration: 0.5, animations: {
                    card.center = self.view.center
            })
            }
            
            UIView.animate(withDuration: 0.2, animations: {
                card.transform = CGAffineTransform(rotationAngle: 0)
            })
            
            UIView.animate(withDuration: 0.5, animations: {
                card.alpha = 1
            })
        }
    }
    
    
    
    func Swiped(card : UIView) {
        card.alpha = 0
        card.center = self.view.center
        if(compteur < (recipesList?.List.count)! - 1){
        compteur = compteur + 1
        }else{
            compteur = 0
        }
        swipeCardView.setMenu(recipe: (recipesList?.List[compteur])!)
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
