//
//  ProfileViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class User {
    var username: String
    var name: String
    var age: String
    
    init(username: String, name: String, age: String) {
        self.username = username
        self.name = name
        self.age = age
    }
}

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let database = Database.database().reference()
    var ref:DatabaseReference!
    var users = [User]()
    
    override func viewWillAppear(_ animated: Bool) {
        LoadCalls()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func LoadCalls() {
        ref = Database.database().reference()
        let user = Auth.auth().currentUser?.email
        print(user! as String)
        ref.child("users").queryOrdered(byChild: "email").queryEqual(toValue: user).observe(.childAdded, with: { (snapshot) in
            let results = snapshot.value as? [String : AnyObject]
            let email = results?["email"]
            let name = results?["name"]
            let age = results?["age"]
            
            let userr = User(username: email as! String, name: name as! String, age: age as! String)
            self.users.append(userr)
            print("username:\(String(describing: userr.username))")
            
            self.usernameLbl.text = userr.username
            self.infoLbl.text = userr.name + ", " + userr.age + " y.o"
            
            
            })
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        do{
            try FirebaseAuth.Auth.auth().signOut()
            let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
            welcomeVC.modalPresentationStyle = .fullScreen
            welcomeVC.modalTransitionStyle = .crossDissolve
            self.present(welcomeVC, animated: true, completion: nil)
        } catch{
            print("User sign out failed")
        }
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
