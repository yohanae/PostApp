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
                //this is where we will add our error alert
                return
            } else if error == nil {
                //this is where we will add our success alert
            }
        }
    }
    

    
    @IBAction func backButton(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")as! LoginViewController
        self.addChild(loginVC)
        loginVC.view.frame = self.view.frame
        self.view.addSubview(loginVC.view)
        loginVC.didMove(toParent: self)
    
    }
    
    
}
