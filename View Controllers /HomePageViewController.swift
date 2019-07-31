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

    var users: [Users] = [Users]()
    @IBOutlet var userProfileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser?.uid != nil {
            accessAndDisplayUserCridentials()
        }
        checkIfUserIsLoggedIn()
    }
    
    
    
    func checkIfUserIsLoggedIn() {
      if Auth.auth().currentUser?.uid == nil {
        ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "signupOrLoginVC")
        }
    }
    
    
    
    func accessAndDisplayUserCridentials() {
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        let postID = Auth.auth().currentUser?.uid
        ref.child("user").child(postID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // we're now Getting user value
            
            DispatchQueue.main.async {
                guard let value = snapshot.value as? [String:Any] else {
                    print("error here")
                    return
                }
                
                self.users.append(Users(data: value))
                print(self.users)
                
                self.usernameLabel.text = self.users.first?.name
                self.userEmailLabel.text = self.users.first?.email
                self.userProfileImageView.setImage(from: self.users.first?.profileImageUrl)
            }
        })
    }
    
    

    
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch _ as NSError {
          //if there is an error while logging out we will present our alert here
        }
        if Auth.auth().currentUser?.uid == nil {
            ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "signupOrLoginVC")
        }
    }
    

}
