//
//  Menus.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 24/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit



class Menus: UIViewController{
    
    
    
    @IBOutlet weak var TableViewMenu: UITableView!
    
    
    var data: [modeleMenu]  = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = createMenus()
        self.hideKeyboardWhenTappedAround() 
        
        TableViewMenu.delegate = self
        TableViewMenu.dataSource = self
    }
    
    
    func createMenus() -> [modeleMenu]{
        var menus: [modeleMenu] = []
        let menu1 = modeleMenu(image: #imageLiteral(resourceName: "menu.png"), nom: "MEr", prix: "8€", details: "RERERERERERERERERERER")
        let menu2 = modeleMenu(image: #imageLiteral(resourceName: "menu.png"), nom: "MEr", prix: "9€", details: "RERERERERERERERERERER")
        let menu3 = modeleMenu(image: #imageLiteral(resourceName: "menu.png"), nom: "MEr", prix: "10€", details: "RERERERERERERERERERER")
        menus.append(menu1)
        menus.append(menu2)
        menus.append(menu3)
        return menus
    }
    
    
}
extension Menus: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menu = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenusTableViewCell
        cell.setMenu(menu: menu)
        return cell
    }
}
