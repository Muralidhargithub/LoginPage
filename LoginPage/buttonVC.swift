//
//  buttonVC.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/11/24.
//

import UIKit

class buttonVC: UIViewController {
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var alreadyButton: UIButton!

    
    @IBOutlet weak var myButton: UIButton! // Connect one of your buttons
    // Note: You don't need to connect every button as an outlet
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonTapped(createButton)
        buttonTapped(alreadyButton)

        
        // Set default appearance for your button
        myButton.layer.cornerRadius = 10
        myButton.clipsToBounds = true
    }
    
    //    @IBAction func buttonTapped(_ sender: UIButton) {
    //        // Only change the color for buttons with a tag of 1
    //        if sender.tag == 1 {
    //            sender.setTitleColor(.orange, for: .normal)
    //        }
    //    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        // Check if the button’s tag is 1
        if sender.tag == 1 {
            sender.setTitleColor(.orange, for: .normal) // Change the title color to orange
        }
    }
    
}
