//
//  mainTabVC.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/21/24.
//

import UIKit

class mainTabVC: UITabBarController {
    
    var username: String? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        if let username = username {
            self.title = "Welcome, \(username)"
            
        }
        
    }
}
