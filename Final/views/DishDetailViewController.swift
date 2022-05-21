//
//  DishDetailViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
 
class DishDetailViewController: UIViewController {
 
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var caloriesLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var dplaceOrder: UIButton!
    @IBOutlet weak var genre: UILabel!
    
    var dish: Dish! 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
        // Do any additional setup after loading the view.
    }
    
    private func populateView(){
        dishImageView.image = dish.image
        titleLbl.text = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text = dish.calories
        genre.text = dish.genre
    }
    
    @IBAction func BtnClicked(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New order", message: "Your order is accepted!", preferredStyle: .alert)
        let Ok = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(Ok)
        present(alert, animated: true, completion: nil)
    }
    
//    @IBAction func readManga(_ sender: Any) {
//        let customURL = "https://mangax1.com/wp-content/uploads/WP-manga/data/4123/8fe1f2e455ff223c81a6441733982773/1.jpgck://"
//        if let url = URL(string: customURL){
//            if UIApplication.shared.canOpenURL(url){
//                UIApplication.shared.open(url)
//            }else{
//                print("error")
//            }
//        }
//    }
    
 
}
 
