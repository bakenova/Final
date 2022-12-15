//
//  DishDetailViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class MangaDetailViewController: UIViewController {
 
    @IBOutlet weak var mangaImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var genre: UILabel!
    
    var manga: CompletedManga! 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView(){
        mangaImageView.image = manga.image
        titleLbl.text = manga.name
        descriptionLbl.text = manga.description
        statusLbl.text = manga.status
        genre.text = manga.genre
    }
    
}
 
