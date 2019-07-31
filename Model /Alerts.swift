//
//  Alerts.swift
//  PostApp
//
//  Created by yoyo on 7/31/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import Foundation
import UIKit

class Alerts {
    
    static func showAlert(Title: String, Message: String, viewControllerToPresentAlert: UIViewController) {
        
        let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        viewControllerToPresentAlert.present(alert, animated: true, completion: nil)
        
    }
    
    
}
