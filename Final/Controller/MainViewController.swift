//
//  MainViewController.swift
//  Final
//
//  Created by Arailym on 21.05.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var nextPressed: UIButton!
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let signUpVC = storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
                
        signUpVC.modalPresentationStyle = .fullScreen
        //signUpVC.modalTransitionStyle = .crossDissolve
        
        present(signUpVC, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextPressed.layer.cornerRadius = 28.0
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
