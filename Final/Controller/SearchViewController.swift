//
//  SearchViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTF: TextFieldPadding!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchPressed(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
