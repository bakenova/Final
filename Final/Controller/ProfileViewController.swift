//
//  ProfileViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var ftableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
/*
        ftableview.delegate = self
        ftableview.dataSource = self*/
        
    }
    
    @IBAction func editPressed(_ sender: Any) {
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
    }
    
}

/*extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}*/
