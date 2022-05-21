//
//  SignInViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTF: TextFieldPadding!
    @IBOutlet weak var passwordTF: TextFieldPadding!
    @IBOutlet weak var warningLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        warningLbl.isHidden = true
    }
    
    @IBAction func backArrowPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logInPressed(_ sender: Any) {
    }
    
    
    
    //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
