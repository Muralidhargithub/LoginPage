//
//  TroubleLoginVC.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/12/24.
//

import UIKit

class TroubleLoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textCornerRadius: UITextField!
    @IBOutlet var sendButtonRadius: UIButton!
    @IBOutlet var backButtonradius: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyCornerRadius(to: textCornerRadius)
        applyCornerRadius(to: sendButtonRadius)
        applyCornerRadius(to: backButtonradius)
        
        textCornerRadius.delegate = self


        
    }
    func applyCornerRadius(to view: UIView) {
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Highlight the border color
        textField.layer.borderColor = UIColor.blue.cgColor // Change color to blue when active
        textField.layer.borderWidth = 2.0 // Increase width when focused
    }
    
    // When the text field resigns focus
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Revert the border color to the default
        textField.layer.borderColor = UIColor.orange.cgColor // Default color when not focused
        textField.layer.borderWidth = 1.0 // Reset width
    }

}
