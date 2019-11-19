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
    var prepareCategories: [Category]  = []
    static var Categories: [Category]  = []
    var isCategoriesExpanded : Bool = false
    var isGainExpanded : Bool = false
    var isEcoExpanded : Bool = false
    var isNutriExpanded : Bool = false
    var isEcoloExpanded : Bool = false
    private static let categoryUrl = URL(string: "http://localhost:3000/category")!
    var collectionViewHeight : CGSize = CGSize(width: 0, height: 0)
    var indexCategories : IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainVC.getCategories()
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
                        let categories = try? JSONDecoder().decode([Category].self, from: data)
                        Categories = categories!
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
    
    @IBAction func expandCategorie(_ sender: Any) {
    
        isCategoriesExpanded = !isCategoriesExpanded
        AccueilTableView.beginUpdates()
        AccueilTableView.reloadRows(at: [indexCategories], with: .automatic)
        AccueilTableView.endUpdates()
        

    }
    func reloadData() {
        isCategoriesExpanded = !isCategoriesExpanded
        self.AccueilTableView.beginUpdates()
        self.AccueilTableView.reloadRows(at: [indexCategories], with: .automatic)
        self.AccueilTableView.endUpdates()
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
                return CGFloat(prepareCategories.count * 50)
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
            MainVC.getCategories()
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
        return prepareCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        MainVC.getCategories()
        let categorie = prepareCategories[indexPath.row]
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
            
        let swipeVC = segue.destination as! SwipeViewController
        let senderCell = sender as! categoriesCollectionViewCell
        SwipeViewController.recipesUrl = URL(string:"http://localhost:3000/recipes/category/" + senderCell.labelCategorie.text!)!
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


