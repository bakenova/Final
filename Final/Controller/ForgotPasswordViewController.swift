//
//  ForgotPasswordViewController.swift
//  Final
//
//  Created by Yerkezhan on 22.05.2022.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTF: TextFieldPadding!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func forgotPassword(_ sender: Any) {
        let auth = Auth.auth()
              
              auth.sendPasswordReset(withEmail: emailTF.text!) { (error) in
                  if let error = error {
//                      let alert = Service.createAlertController(title: "Error", message: error.localizedDescription)
                    let alert = UIAlertController(title: "Error", message: "There is no user record corresponding to this identifier. The user may have been deleted", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{_ in}))
                      self.present(alert, animated: true, completion: nil)
                      return
                  }
                
                let alert = UIAlertController(title: "All done!", message: "A password reset email has been sent!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{_ in}))
//                  let alert = Service.createAlertController(title: "Hurray", message: "A password reset email has been sent!")
                  self.present(alert, animated: true, completion: nil)
              }
    }
    
    @IBAction func Back(_ sender: Any) {
        let tableVC = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        tableVC.modalPresentationStyle = .fullScreen
        self.present(tableVC, animated: true, completion: nil)
    }
    
    

}
