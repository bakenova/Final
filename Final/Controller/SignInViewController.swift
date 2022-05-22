//
//  SignInViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTF: TextFieldPadding!
    @IBOutlet weak var passwordTF: TextFieldPadding!
    @IBOutlet weak var warningLbl: UILabel!
    
    @IBOutlet weak var constraintMove: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

        warningLbl.isHidden = true
    }
    
    @IBAction func backArrowPressed(_ sender: Any) {
        let tableVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        tableVC.modalPresentationStyle = .fullScreen
        self.present(tableVC, animated: true, completion: nil)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        let tableVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        tableVC.modalPresentationStyle = .fullScreen
        self.present(tableVC, animated: true, completion: nil)
    }
    
        
    func showCreateAccount(email: String, passw: String){
        warningLbl.isHidden = false
        constraintMove.constant = 30

    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
            let alert = UIAlertController(title: "The field is empty", message: "Please, fill the field", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{_ in}))
            present(alert, animated: true)
            print("The field is empty!")
            return
        }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { result, error in
            
            guard error == nil else {
                self.showCreateAccount(email: email, passw: password)
                return
            }
            print("User has signed in")
            let tableVC = self.storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            tableVC.modalPresentationStyle = .fullScreen
            self.present(tableVC, animated: true, completion: nil)
        })
    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        let tableVC = self.storyboard?.instantiateViewController(withIdentifier: "forgotPassword") as! ForgotPasswordViewController
        tableVC.modalPresentationStyle = .fullScreen
        self.present(tableVC, animated: true, completion: nil)
    }
    

}
