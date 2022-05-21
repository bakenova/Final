//
//  SignUpViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTF: TextFieldPadding!
    @IBOutlet weak var passwordTF: TextFieldPadding!
    @IBOutlet weak var usernameTF: TextFieldPadding!
    @IBOutlet weak var ageTF: UITextField!
    @IBOutlet weak var existLabel: UILabel!
    @IBOutlet weak var hiddenConstraint: NSLayoutConstraint!
    
    let database = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        existLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backArrowPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        let signinVC = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        
        signinVC.modalPresentationStyle = .fullScreen
        
        present(signinVC, animated: true, completion: nil)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        /*
        guard let email = emailTF.text, !email.isEmpty,
              let password = passwordTF.text, !password.isEmpty else {
            let alert = UIAlertController(title: "The field is empty", message: "Please, fill the field", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{_ in}))
            
            present(alert, animated: true)
            print("The field is empty!")
            return
        }
        
        let object: [String: Any] = [
            "email": emailTF.text!,
            "name": usernameTF.text!,
            "age": ageTF.text!
        ]
        database.child("users").child("user_\(Int.random(in:0..<100))").setValue(object)
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
            guard error == nil else {
            print("User creation failed")
                let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
                self.present(registerVC, animated: true, completion: nil)
            return
            }
            print("User has been sent to RegisterViewController")
            
            let tableVC = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! TabViewController
            tableVC.modalPresentationStyle = .fullScreen
            self.present(tableVC, animated: true, completion: nil)
        })
 */
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
