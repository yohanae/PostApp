//
//  ForgotPasswordViewController.swift
//  PostApp
//
//  Created by yoyo on 7/16/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {

   
    @IBOutlet weak var emailAddressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func sendEmailButton(_ sender: Any) {
        guard let email = emailAddressTextField.text else { return }
        
        Auth.auth().sendPasswordReset(withEmail: email)  { (error) in
            if error != nil {
                self.showAlert(Title: "Error", Message: "There seems to be something wrong with the Email Address you entered. Please try again")
                return
            } else if error == nil {
                self.showAlert(Title: "Sent!", Message: "An email has been sent to the address you provided")
            }
        }
    }
    

    func showAlert(Title: String, Message: String) {
        
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")as! LoginViewController
        self.addChild(loginVC)
        loginVC.view.frame = self.view.frame
        self.view.addSubview(loginVC.view)
        loginVC.didMove(toParent: self)
    
    }
    
    
}
