//
//  HomeViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
 
class HomeViewController: UIViewController {
    
//  MARK: - Defining variables, outlets, actions
    let database = Database.database().reference()
    var user = Auth.auth().currentUser
    
    var categories: [MustRead] = [
        .init(id: "1", name: "Doctor's Rebirth", image: UIImage(imageLiteralResourceName: "images") ),
        .init(id: "1", name: "Vegan", image: UIImage(imageLiteralResourceName: "images") ),
        .init(id: "1", name: "Pescatarian", image: UIImage(imageLiteralResourceName: "images") ),
        .init(id: "1", name: "Fruitarian", image: UIImage(imageLiteralResourceName: "images") ),
        .init(id: "1", name: "Beegan", image: UIImage(imageLiteralResourceName: "images") )
    ]
    
    var populars: [CompletedManga] = [
        .init(id: "2", name: "The Knight Of Embers", description: "His only family, his younger twin, has been murdered. He isn't as talented as his late genius brother, but in order to get his revenge, he will become strong. Will I be able to get my revenge?", status: "Status: Ongoing", image: UIImage(imageLiteralResourceName: "The Knight Of Embers"), genre: "Genres :    Action - Adventure - Fantasy"),
        .init(id: "2", name: "Locker Opener", description: "In front of detective Dobin Kim, who has the ability to ‘open’ anything, a criminal ‘locker’ who ‘locks’ anything appears. The ‘opener’ struggles to catch the ‘locker’ in front of the important truth, one-of-a-kind relationship, and ‘locked up’ of a genius talent helplessly…!", status: "Status : Ongoing", image: UIImage(imageLiteralResourceName: "Locker Opener"), genre: "Genres: Drama"),
        .init(id: "2", name: "The World After the Fall", description: "Humans were suddenly summoned to become “Walkers”, and they needed to clear the tower to save the world. Then, the “Regression Stone” was discovered. Walkers could now “return” to the past. And slowly… everyone left. Humanity's last hope, “Carpe Diem”, was formed by people who refused to abandon the world. But once the last Walker reached floor 100, he no longer knew what to believe. This is the tale of the only man who didn't regress, despite everyone else going back to the past.", status: "Status : Ongoing", image: UIImage(imageLiteralResourceName: "The World After the Fall"), genre: "Genres : Action, Adventure, Drama, Fantasy, Manhwa, Webtoons"),
        .init(id: "2", name: "Reincarnated War God", description: "A desperate forty-year war that has extinguished both hope and happiness. Jinwoon, a man who was the god of battle, returned after living two lives to overturn the battle of the defeated war.", status: "Status: Ongoing", image: UIImage(imageLiteralResourceName: "Reincarnated War God"), genre: "Genres:  Action - Historical")
    ]
    
    var specials: [CompletedManga] = [
        .init(id: "2", name: "Spy X Family", description: "The master spy codenamed  has spent his days on undercover missions, all for the dream of a better world. But one day, he receives a particularly difficult new order from command. For his mission, he must form a temporary family and start a new life?! A Spy/Action/Comedy about a one-of-a-kind family!", status: "Status: Ongoing", image: UIImage(imageLiteralResourceName: "Spy X Family"), genre: "Genres :    Action - Adventure - Comedy - Shounen"),
        .init(id: "2", name: "Martial Peak", description: "As well as being tasty, this aubergine and artichoke is low fat, low calorie and cost effective. Make a large batch and eat it cold the next day", status: "Status: Ongoing", image: UIImage(imageLiteralResourceName: "Martial Peak"), genre: "Genres: Action - Adventure - Fantasy - Historical - Martial arts"),
        .init(id: "2", name: "The Beginning After The End", description: "King Grey has unrivaled strength, wealth, and prestige in a world governed by martial ability. However, solitude lingers closely behind those with great power. Beneath the glamorous exterior of a powerful king lurks the shell of man, devoid of purpose and will. Reincarnated into a new world filled with magic and monsters, the king has a second chance to relive his life. Correcting the mistakes of his past will not be his only challenge, however. Underneath the peace and prosperity of the new world is an undercurrent threatening to destroy everything he has worked for, questioning his role and reason for being born again.", status: "Status: Ongoing", image: UIImage(imageLiteralResourceName: "The Beginning After The End"), genre: "Genres: Action - Adventure - Comedy - Fantasy - Webtoons")
    ]
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        specialsCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        
        registerCells()
    }
    
    @IBAction func logOut(_ sender: Any) {
        do{
            try! FirebaseAuth.Auth.auth().signOut()
            let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
            welcomeVC.modalPresentationStyle = .fullScreen
            welcomeVC.modalTransitionStyle = .crossDissolve
            self.present(welcomeVC, animated: true, completion: nil)
        } catch{
            print("User sign out failed")
        }
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: MustReadViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: MustReadViewCell.identifier)
        popularCollectionView.register(UINib(nibName: PopularsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularsCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: CompletedMangaCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CompletedMangaCollectionViewCell.identifier)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MustReadViewCell.identifier, for: indexPath) as! MustReadViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularsCollectionViewCell.identifier, for: indexPath) as! PopularsCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  CompletedMangaCollectionViewCell.identifier, for: indexPath) as! CompletedMangaCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            
        }else {
            let controller = MangaDetailViewController.instantiate()
            controller.manga = collectionView == popularCollectionView ?
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
