//
//  CategoriesTableViewCell.swift
//  Gram
//
//  Created by EPF Projets Sceaux on 28/07/2019.
//  Copyright © 2019 EPF Projets Sceaux. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    



}

extension CategoriesTableViewCell  {
    
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        categoriesCollectionView.delegate = dataSourceDelegate
        categoriesCollectionView.dataSource = dataSourceDelegate
        categoriesCollectionView.tag = row
       
        categoriesCollectionView.reloadData()
    }
    
    
    
}
