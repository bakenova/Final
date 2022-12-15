//
//  CategoryCollectionViewCell.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class MustReadViewCell: UICollectionViewCell {
 
    static let identifier = String(describing: MustReadViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLbl: UILabel!
    
    func setup(category: MustRead) {
        categoryTitleLbl.text = category.name
        categoryImageView.image = category.image
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

struct MustRead {
    let id, name: String?
    let image: UIImage
}
