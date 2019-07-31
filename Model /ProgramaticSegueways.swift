//
//  ProgramaticSegueways.swift
//  PostApp
//
//  Created by yoyo on 7/31/19.
//  Copyright © 2019 Compitence Over Identity Technologies. All rights reserved.
//

import Foundation
import UIKit

class ProgramaticSegueways {
    
     static func segueTo (currentViewController: UIViewController, destinationViewController: String?) {
        let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(destinationViewController!)")
        currentViewController.present(destinationVC, animated: true, completion: nil)
    }
    
    
    
    
}
