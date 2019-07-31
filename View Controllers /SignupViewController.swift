//
//  SignupViewController.swift
//  PostApp
//
//  Created by yoyo on 7/15/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var profilePictureImage: UIImageView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePictureImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (handleTheSelectedProfileImage)))
    }

    @objc func handleTheSelectedProfileImage() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImageFromThePicker: UIImage?
        
        if let editedProfileImage = info [.editedImage] as? UIImage {
            selectedImageFromThePicker = editedProfileImage
            self.profilePictureImage.image = selectedImageFromThePicker!
            dismiss(animated: true, completion: nil)
            
        } else if let orignalProfileImage = info [UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImageFromThePicker = orignalProfileImage
            self.profilePictureImage.image = selectedImageFromThePicker!
            dismiss(animated: true, completion: nil)
        }
        
    }

    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
                self.showAlert(Title: "Ooops", Message: "something went wrong while trying to sign you up, please check the cridentials you entered and make sure you havent left any textfields open1")
                return
            }
            guard let uid = result?.user.uid else {
                return
            }
            
            //user created successfully
            let profileImageName = NSUUID().uuidString
            let storage = Storage.storage().reference().child("AllProfileImages").child("\(profileImageName).png")
            
             if let uploadData = self.profilePictureImage.image!.pngData() {
                storage.putData(uploadData, metadata: nil, completion: { (metadata, error) in
                    
                    if error != nil {
                        print ("data was not put in storage")
                        return
                    }
            //data uploaded to storage successfully
                    storage.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error!.localizedDescription)
                            return
                        }
            //URL Downloaded successfully
                        if let profileImageUrl = url?.absoluteString {
                            let values = ["name": username, "email": email, "profileImageUrl": profileImageUrl] as [String : Any]
                            self.registerUserIntoDatabaseWithUID(uid: uid, Values: values as [String : AnyObject])
                        }
                    })
                })
            }
        })
    }
    
   
   
    
    func registerUserIntoDatabaseWithUID(uid: String, Values: [String: AnyObject]) {
       
        guard let email = emailTextfield.text else { return }
        guard let password = passwordTextfield.text else { return }
       
        let ref = Database.database().reference(fromURL: "https://post-app-31905.firebaseio.com/" )
        let userReference = ref.child("user").child(uid)
        //let values = ["userEmail": email, "username": username]
        userReference.updateChildValues( Values, withCompletionBlock: {
            (err, ref) in
            if err != nil {
                
                self.showAlert(Title: "Ooops", Message: "something went wrong while trying to sign you up, please check the cridentials you entered and make sure you havent left any textfields open2")
                return
            }
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error != nil{
                    self.showAlert(Title: "Ooops", Message: "Your user profile has been created but something went wrong while signing you in, please go back and login with the cridentials you have just used to sign up")
                    return
                }
                
                self.goToHomePage()
                
            })
        })
    }
    
    
    
    func showAlert(Title: String, Message: String) {
        
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    
    
    func goToHomePage() {
          ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "tabBarController")
    }
    
    

    
    @IBAction func backButton(_ sender: Any) {
       ProgramaticSegueways.segueTo(currentViewController: self, destinationViewController: "signupOrLoginVC")
    }
    
    
}
