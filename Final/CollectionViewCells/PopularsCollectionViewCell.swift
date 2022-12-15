//
//  DishPortraitCollectionViewCell.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class PopularsCollectionViewCell: UICollectionViewCell {
 
    static let identifier = "DishPortraitCollectionViewCell"
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: CompletedManga) {
        titleLbl.text = dish.name
        dishImageView.image = dish.image
        caloriesLbl.text = dish.status
        
        descriptionLbl.text = dish.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
