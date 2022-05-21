//
//  HomeViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class HomeViewController: UIViewController {
 
    @IBOutlet weak var categoryCollectionView: UICollectionView!
      @IBOutlet weak var popularCollectionView: UICollectionView!
      @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    var categories: [DishCategory] = [
           .init(id: "1", name: "Doctor's Rebirth", image: UIImage(imageLiteralResourceName: "images") ),
           .init(id: "1", name: "Vegan", image: UIImage(imageLiteralResourceName: "images") ),
           .init(id: "1", name: "Pescatarian", image: UIImage(imageLiteralResourceName: "images") ),
           .init(id: "1", name: "Fruitarian", image: UIImage(imageLiteralResourceName: "images") ),
           .init(id: "1", name: "Beegan", image: UIImage(imageLiteralResourceName: "images") )
       ]
       
       var populars: [Dish] = [
        .init(id: "2", name: "The Knight Of Embers", description: "His only family, his younger twin, has been murdered. He isn't as talented as his late genius brother, but in order to get his revenge, he will become strong. Will I be able to get my revenge?", calories: "Status: Ongoing Genres :    Action - Adventure - Fantasy", image: UIImage(imageLiteralResourceName: "The Knight Of Embers")),
        .init(id: "2", name: "Locker Opener", description: "In front of detective Dobin Kim, who has the ability to ‘open’ anything, a criminal ‘locker’ who ‘locks’ anything appears. The ‘opener’ struggles to catch the ‘locker’ in front of the important truth, one-of-a-kind relationship, and ‘locked up’ of a genius talent helplessly…!", calories: "Status : Ongoing      Genres: Drama", image: UIImage(imageLiteralResourceName: "Locker Opener")),
        .init(id: "2", name: "The World After the Fall", description: "Humans were suddenly summoned to become “Walkers”, and they needed to clear the tower to save the world. Then, the “Regression Stone” was discovered. Walkers could now “return” to the past. And slowly… everyone left. Humanity's last hope, “Carpe Diem”, was formed by people who refused to abandon the world. But once the last Walker reached floor 100, he no longer knew what to believe. This is the tale of the only man who didn't regress, despite everyone else going back to the past.", calories: "Status : Ongoing      Genres : Action, Adventure, Drama, Fantasy, Manhwa, Webtoons", image: UIImage(imageLiteralResourceName: "The World After the Fall")),
        .init(id: "2", name: "Chicken pasta bake", description: "Enjoy this gooey cheese and chicken pasta bake for the ultimate weekday family dinner. Serve straight from the dish with a dressed green salad ", calories: "102", image: UIImage(imageLiteralResourceName: "images"))
       ]
       
       var specials: [Dish] = [
        .init(id: "2", name: "Herby fish fingers with Chinese-style rice", description: "This healthy, gluten-free lunch or dinner supplies a balance of carbs and protein, making it perfect for refuelling after exercise", calories: "12", image: UIImage(imageLiteralResourceName: "images")),
        .init(id: "2", name: "Artichoke & aubergine rice", description: "As well as being tasty, this aubergine and artichoke is low fat, low calorie and cost effective. Make a large batch and eat it cold the next day", calories: "212", image: UIImage(imageLiteralResourceName: "images")),
        .init(id: "2", name: "Spanish rice & prawn one-pot", description: "A fast and easy meal filled with Mediterranean holiday flavours", calories: "122", image: UIImage(imageLiteralResourceName: "images")),
        .init(id: "2", name: "Quick beef & broccoli one-pot", description: "The most delicious beef and broccoli meal in one pot, fast! Contains 2 of your 5-a-day", calories: "102", image: UIImage(imageLiteralResourceName: "images"))
       ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specialsCollectionView.dataSource = self
        specialsCollectionView.delegate = self
                
                registerCells()
        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
           categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
           popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
           specialsCollectionView.register(UINib(nibName: DIshLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DIshLandscapeCollectionViewCell.identifier)
       }
}
 
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  DIshLandscapeCollectionViewCell.identifier, for: indexPath) as! DIshLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
 
        }else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ?
            populars[indexPath.row] :
            specials[indexPath.row]
            navigationController? .pushViewController(controller, animated: true)
        }
    }
}
 
extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
        
    }
}
 
 
 
 
 
 
 
 


