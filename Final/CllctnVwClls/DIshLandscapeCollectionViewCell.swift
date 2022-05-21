//
//  DIshLandscapeCollectionViewCell.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class DIshLandscapeCollectionViewCell: UICollectionViewCell {
 
    static let identifier = String(describing: DIshLandscapeCollectionViewCell.self)
        
        @IBOutlet weak var dishImageView: UIImageView!
        @IBOutlet weak var titleLbl: UILabel!
        @IBOutlet weak var descriptionLbl: UILabel!
        @IBOutlet weak var caloriesLbl: UILabel!
        
        func setup(dish: Dish) {
            dishImageView.image = dish.image
            titleLbl.text = dish.name
            descriptionLbl.text = dish.description
            caloriesLbl.text = dish.calories
        }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
}
struct Dish {
    let id, name, description: String?
    let calories: String?
    let image: UIImage
    
//    var formattedCalories: String {
//        return "\(calories ?? 0) calories"
//    }
}
 
