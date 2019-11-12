//
//  MainVC.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 18/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit


class MainVC: UIViewController{
     
    @IBOutlet weak var AccueilTableView: AccueilTableView!
    
    var data: [Categories]  = []
    var isCategoriesExpanded : Bool = false
    var isGainExpanded : Bool = false
    var isEcoExpanded : Bool = false
    var isNutriExpanded : Bool = false
    var isEcoloExpanded : Bool = false
    private static let quoteUrl = URL(string: "http://localhost:3000/category")!
    
    
    
    
    var indexCategories : IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = createCategories()
        
        self.hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self,
                                                      selector: #selector(showAccueil),
                                                      name: NSNotification.Name("Accueil"),
                                                      object: nil)
               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(showFavoris),
                                                      name: NSNotification.Name("Favoris"),
                                                      object: nil)

               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(showSwipe),
                                                      name: NSNotification.Name("Swipe"),
                                                      object: nil)
               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(showGram),
                                                      name: NSNotification.Name("Gram"),
                                                      object: nil)
               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(showProfile),
                                                      name: NSNotification.Name("Profil"),
                                                      object: nil)
               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(showPanier),
                                                      name: NSNotification.Name("Panier"),
                                                      object: nil)
               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(showCalendrier),
                                                      name: NSNotification.Name("Calendrier"),
                                                      object: nil)
               NotificationCenter.default.addObserver(self,
                                                      selector: #selector(Disconnect),
                                                      name: NSNotification.Name("Deconnexion"),
                                                      object: nil)
    }
        static func getCategories() {
            let request = createCategoryRequest()
            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: request) { (data, response, error) in
                if let data = data, error == nil {
                    if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                        if let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
                            let category = responseJSON["name"],
                            let categoryImage = responseJSON["image_id"] {
                        }
                    }
                }
            }
            task.resume()
        }

        private static func createCategoryRequest() -> URLRequest {
            var request = URLRequest(url: quoteUrl)
            request.httpMethod = "POST"

            let body = "method=getQuote&lang=en&format=json"
            request.httpBody = body.data(using: .utf8)

            return request
        }
    
    
    @objc func showAccueil(){
        /*
        performSegue(withIdentifier: "showAccueil", sender: nil)
 */
 }
    
    @objc func showFavoris(){
        performSegue(withIdentifier: "showFavoris", sender: nil)
        
    }
    
    @objc func showSwipe(){
        performSegue(withIdentifier: "showSwipe", sender: nil)
        
    }
    
    @objc func showGram(){
        performSegue(withIdentifier: "showGram", sender: nil)
        
    }
    
    @objc func showProfile(){
        performSegue(withIdentifier: "showProfile", sender: nil)
        
    }
    
    @objc func showPanier(){
        performSegue(withIdentifier: "showPanier", sender: nil)
        
    }
    
    @objc func showCalendrier(){
        performSegue(withIdentifier: "showCalendrier", sender: nil)
        
    }
    
    @objc func Disconnect(){
        
    }
    
    @IBAction func onMoreTapped(_ sender: UIBarButtonItem)
    {
        NotificationCenter.default.post(name: NSNotification.Name("ToggleMenu"), object: nil)
    }
    
    
    
    func createCategories() -> [Categories]{
        var menus: [Categories] = []
        let menu1 = Categories(imageCategorie: #imageLiteral(resourceName: "menu.png"), nomCategorie: "Vegan")
        let menu2 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Vegans")
        let menu3 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Veganss")
        let menu4 = Categories(imageCategorie: #imageLiteral(resourceName: "menu.png"), nomCategorie: "Vegan")
        let menu5 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Vegans")
        let menu6 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Veganss")
        let menu7 = Categories(imageCategorie: #imageLiteral(resourceName: "menu.png"), nomCategorie: "Vegan")
        let menu8 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Vegans")
        let menu9 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Veganss")
        let menu10 = Categories(imageCategorie: #imageLiteral(resourceName: "menu.png"), nomCategorie: "Vegan")
        let menu11 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Vegans")
        let menu12 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Veganss")
        let menu13 = Categories(imageCategorie: #imageLiteral(resourceName: "menu.png"), nomCategorie: "Vegan")
        let menu14 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Vegans")
        let menu15 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Veganss")
        let menu16 = Categories(imageCategorie: #imageLiteral(resourceName: "menu.png"), nomCategorie: "Vegan")
        let menu17 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Vegans")
        let menu18 = Categories(imageCategorie: #imageLiteral(resourceName: "close-envelope.png"), nomCategorie: "Veganss")
        menus.append(menu1)
        menus.append(menu2)
        menus.append(menu3)
        menus.append(menu4)
        menus.append(menu5)
        menus.append(menu6)
        menus.append(menu7)
        menus.append(menu8)
        menus.append(menu9)
        menus.append(menu10)
        menus.append(menu11)
        menus.append(menu12)
        menus.append(menu13)
        menus.append(menu14)
        menus.append(menu15)
        menus.append(menu16)
        menus.append(menu17)
        menus.append(menu18)
        return menus
    }
    @IBAction func expandCategorie(_ sender: Any) {
    
            isCategoriesExpanded = !isCategoriesExpanded
            AccueilTableView.beginUpdates()
        AccueilTableView.reloadRows(at: [indexCategories], with: .automatic)
        AccueilTableView.endUpdates()
        

    }
    
}

    
    
    

extension MainVC : UITableViewDelegate,UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? CategoriesTableViewCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            if(isCategoriesExpanded){
                return 950
            }else{
            return 200
            }
        case 1:
            return 50
        case 2:
            return 50
        case 4:
            return 50
        case 6:
            return 50
        case 8:
            return 50
        case 3:
            if(isGainExpanded){
                return 200
            }else{
                return 0
            }
        case 5:
            if(isEcoExpanded){
                return 200
            }else{
                return 0
            }
            
        case 7:
            if(isNutriExpanded){
                return 200
            }else{
                return 0
            }
        case 9:
            if(isEcoloExpanded){
                return 200
            }else{
                return 0
            }
        case 10:
            return 500
        case 11:
            return 300
        default:
           return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0)
        {
            indexCategories = indexPath
            let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
            
            return cell
        }
        if(indexPath.row == 1){
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandCell", for: indexPath)
            return cell
        }
        if((indexPath.row == 2) || (indexPath.row == 4) || (indexPath.row == 6) || (indexPath.row == 8 )  ){
            let cell = tableView.dequeueReusableCell(withIdentifier: "PropagandaCellButton", for: indexPath)
            return cell
        }
        if((indexPath.row == 3) || (indexPath.row == 5) || (indexPath.row == 7) || (indexPath.row == 9 )  ){
            let cell = tableView.dequeueReusableCell(withIdentifier: "PropagandaCell", for: indexPath)
            return cell
        }
        if(indexPath.row == 10) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "servicesCell", for: indexPath)
            return cell
        }
        if(indexPath.row == 11) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
            return cell
        }
        if((indexPath.row == 3) || (indexPath.row == 5) || (indexPath.row == 7) || (indexPath.row == 9 )  ){
            let cell = tableView.dequeueReusableCell(withIdentifier: "PropagandaCell", for: indexPath)
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropagandaCellButton", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        self.data = createCategories()
        let categorie = data[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! categoriesCollectionViewCell
        cell.setCategorie(categorie: categorie)
        cell.addButtonTapAction = {
            self.performSegue(withIdentifier:
                "showSwipe", sender: cell
            )
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        if(segue.identifier == "showSwipe"){
            
        let menuVC = segue.destination as! SwipeViewController
        let button = sender as! categoriesCollectionViewCell
            menuVC.categorie = button.labelCategorie.text!
    }
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


