//
//  LoginViewController.swift
//  PostApp
//
//  Created by yoyo on 7/15/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
   
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func loginButton(_ sender: Any) {
    loginRegister()
    }
    
    func loginRegister() {
        guard let email = emailTextfield.text else { return }
        guard let password = passwordTextfield.text else { return}
        
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil{
                self.showAlert(Title: "Error", Message: "Something went wrong. Please check your Network and or the email and password you used and try again")
                return
            }
            
            self.goToHomePage()
            
        })
    }
    
    
    func goToHomePage() {
         ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "tabBarController")
    }
    

    func showAlert(Title: String, Message: String) {
        
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func forgotPasswordButton(_ sender: Any) {
        ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "forgotPasswordVC")
    }
    
    
    @IBAction func backButton(_ sender: Any) {
       ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "signupOrLoginVC")
        
    }
    
    
}
