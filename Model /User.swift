//
//  User.swift
//  PostApp
//
//  Created by yoyo on 7/31/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import Foundation
import UIKit

struct Users {
    var name: String = ""
    var email: String = ""
    var profileImageUrl: String = ""
    
    init(data: [String:Any]) {
        
        if let obj = data["name"] as? String {
            self.name = obj
        }
        if let obj = data["email"] as? String {
            self.email = obj
        }
        if let obj = data["profileImageUrl"] as? String {
            self.profileImageUrl = obj
        }
    }
    
}
