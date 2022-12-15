//
//  DIshLandscapeCollectionViewCell.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class CompletedMangaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: CompletedMangaCollectionViewCell.self)
    
    @IBOutlet weak var mangaImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    
    func setup(dish: CompletedManga) {
        mangaImageView.image = dish.image
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        statusLbl.text = dish.status
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

struct CompletedManga {
    let id, name, description: String?
    let status: String?
    let image: UIImage
    let genre: String?
}
 
