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
        ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "signupVC")
    }
    
    
    @IBAction func goToLoginPageButton(_ sender: Any) {
        ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "loginVC")
    }
    
    

}
