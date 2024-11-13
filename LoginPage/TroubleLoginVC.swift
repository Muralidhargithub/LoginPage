//
//  TroubleLoginVC.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/12/24.
//

import UIKit

class TroubleLoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var back: UIButton!
    @IBOutlet var textCornerRadius: UITextField!
    @IBOutlet var sendButtonRadius: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyCornerRadius(textCornerRadius)
        applyCornerRadius(sendButtonRadius)
        applyCornerRadius(back)
        setupTextFieldAppearance(textCornerRadius)
        
        textCornerRadius.delegate = self


        
    }
    func applyCornerRadius(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
    
    func setupTextFieldAppearance(_ view:UIView) {
        // Set the default border color and width
        view.layer.borderColor = UIColor.orange.cgColor // Default color
        view.layer.borderWidth = 1.0 // Set border width
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

    @IBAction func back(_ sender: Any) {
        let loginvc = self.storyboard?.instantiateViewController(withIdentifier: "Loginvc") as? Loginvc
        if let objloginvc = loginvc{
            self.navigationController?.pushViewController(objloginvc, animated: true)
        }
    }
}
