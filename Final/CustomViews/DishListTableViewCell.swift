//
//  DishListTableViewCell.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class DishListTableViewCell: UITableViewCell {
 
    static let identifier = "DishListTableViewCell"
      
      @IBOutlet weak var dishImageView: UIImageView!
      @IBOutlet weak var titleLbl: UILabel!
      @IBOutlet weak var descriptionLbl: UILabel!
      
      func setup(dish: CompletedManga) {
        dishImageView.image = dish.image
          titleLbl.text = dish.name
          descriptionLbl.text = dish.description
      }
      
      func setup(order: Order) {
        dishImageView.image = order.image
          titleLbl.text = order.dish?.name
          descriptionLbl.text = order.name
      }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
        // Configure the view for the selected state
    }
    
}
 
struct Order{
    let id: String?
    let name: String?
    let image: UIImage
    let dish: CompletedManga?
}
