//
//  SwipeViewController.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 26/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class SwipeViewController: UIViewController {

    @IBOutlet var swipeCardView: SwipeView!
    var division: CGFloat!
    var compteur : Int = 0
    var data: [modeleMenu]  = []
    var categorie = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        division = (view.frame.width/2) / 0.61
        data = createMenus()
        swipeCardView.setMenu(menu: data[compteur])
        self.hideKeyboardWhenTappedAround() 
        print("test" + categorie)
        // Do any additional setup after loading the view.
    }
    

    func createMenus() -> [modeleMenu]{
        var menus: [modeleMenu] = []
        let menu1 = modeleMenu(image: #imageLiteral(resourceName: "menu.png"), nom: "MEr", details: "RERERERERERERERERERER")
        let menu2 = modeleMenu(image: #imageLiteral(resourceName: "menu.png"), nom: "Mpo", details: "RERERERERERERERERERER")
        let menu3 = modeleMenu(image: #imageLiteral(resourceName: "menu.png"), nom: "Mml", details: "RERERERERERERERERERER")
        menus.append(menu1)
        menus.append(menu2)
        menus.append(menu3)
        return menus
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
        if(compteur < data.count - 1){
        compteur = compteur + 1
        }else{
            compteur = 0
        }
        swipeCardView.setMenu(menu: data[compteur])
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
