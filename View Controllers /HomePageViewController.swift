//
//  HomePageViewController.swift
//  PostApp
//
//  Created by yoyo on 7/15/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import UIKit
import Firebase

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         checkIfUserIsLoggedIn()
    }
    
    
    
    func checkIfUserIsLoggedIn() {
      if Auth.auth().currentUser?.uid == nil {
            let signupOrLoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signupOrLoginVC")as! SignUpOrLoginViewController
            self.present(signupOrLoginVC, animated: true, completion: nil)
        }
    }
    
    
    
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch _ as NSError {
          //if there is an error while logging out we will present our alert here
        }
        if Auth.auth().currentUser?.uid == nil {
            let signupOrLoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signupOrLoginVC")as! SignUpOrLoginViewController
            self.present(signupOrLoginVC, animated: true, completion: nil)
        }
    }
    

}
