//
//  LoginViewController.swift
//  Metrics
//
//  Created by Agrim Srivastava on 26/02/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginClicked(_ sender: UIButton) {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if error != nil {
                print("error")
            }
            else {
                //Go to the next page
                //self.performSegue(withIdentifier: "goToNext", sender: self)
                //self.storyboard?.instantiateViewController(withIdentifier: "mainPage").modalPresentationStyle = .overFullScreen
                //                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                //                let vc = storyboard.instantiateViewController(withIdentifier: "mainPage")
                //                vc.modalPresentationStyle = .overFullScreen
                //                self.present(vc, animated: true)
                if let viewController = self.storyboard?.instantiateViewController(
                    withIdentifier: "tabBarController") {
                    viewController.modalPresentationStyle = .fullScreen
                    self.present(viewController, animated: true)
                }
                
                
            }
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
}
