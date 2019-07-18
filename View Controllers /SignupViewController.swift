//
//  SignupViewController.swift
//  PostApp
//
//  Created by yoyo on 7/15/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    
    @IBAction func signupButton(_ sender: Any) {
    signupRegister()
    }
    
    
    
    func signupRegister() {
        guard let username = usernameTextfield.text else{ return }
        guard let email = emailTextfield.text else { return }
        guard let password = passwordTextfield.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password, completion : { (result, error) in
            if error != nil {
                print ("error is here 1")
                //this is where we'll write our error alert
                return
            }
            guard let uid = result?.user.uid else {
                return
            }
            let ref = Database.database().reference(fromURL: "https://post-app-31905.firebaseio.com/" )
            let userReference = ref.child("user").child(uid)
            let values = ["userEmail": email, "username": username]
            userReference.updateChildValues( values, withCompletionBlock: {
                (err, ref) in
                if err != nil {
        
                    //this is where we'll write our error alert
                    return
                }
                
                Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                    if error != nil{
                        //this is where we'll write our error alert
                    return
                    }
                    
                    self.goToHomePage()
                    
                    })
            })
        })
    }
    
   
    func goToHomePage() {
        let homePageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homePageVC")as! HomePageViewController
        self.addChild(homePageVC)
        homePageVC.view.frame = self.view.frame
        self.view.addSubview(homePageVC.view)
        homePageVC.didMove(toParent: self)
    }
    
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        let signupOrLoginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signupOrLoginVC")as! SignUpOrLoginViewController
        self.addChild(signupOrLoginVC)
        signupOrLoginVC.view.frame = self.view.frame
        self.view.addSubview(signupOrLoginVC.view)
        signupOrLoginVC.didMove(toParent: self)
    }
    
    
}
