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
    }
    
    @IBAction func BtnClicked(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New order", message: "Your order is accepted!", preferredStyle: .alert)
        let Ok = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(Ok)
        present(alert, animated: true, completion: nil)
    }
    
 
}
 
