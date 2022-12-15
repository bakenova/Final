//
//  CategoryCollectionViewCell.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class CategoryCollectionViewCell: UICollectionViewCell {
 
    static let identifier = String(describing: CategoryCollectionViewCell.self)
 
       @IBOutlet weak var categoryImageView: UIImageView!
       @IBOutlet weak var categoryTitleLbl: UILabel!
       
       func setup(category: DishCategory) {
           categoryTitleLbl.text = category.name
        categoryImageView.image = category.image
       }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
}
 
struct DishCategory {
    let id, name: String?
    let image: UIImage
    
}

