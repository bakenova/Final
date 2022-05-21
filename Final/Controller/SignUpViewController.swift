//
//  SignUpViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTF: TextFieldPadding!
    @IBOutlet weak var passwordTF: TextFieldPadding!
    @IBOutlet weak var existLabel: UILabel!
    @IBOutlet weak var hiddenConstraint: NSLayoutConstraint!
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
        existLabel.isHidden = false
        hiddenConstraint.constant = 70
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
