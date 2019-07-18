//
//  SignUpOrLoginViewController.swift
//  PostApp
//
//  Created by yoyo on 7/15/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import UIKit

class SignUpOrLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func goToSignupPageButton(_ sender: Any) {
        let signupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signupVC")as! SignupViewController
        self.addChild(signupVC)
        signupVC.view.frame = self.view.frame
        self.view.addSubview(signupVC.view)
        signupVC.didMove(toParent: self)
    }
    
    
    @IBAction func goToLoginPageButton(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")as! LoginViewController
        self.addChild(loginVC)
        loginVC.view.frame = self.view.frame
        self.view.addSubview(loginVC.view)
        loginVC.didMove(toParent: self)
    }
    
    

}
