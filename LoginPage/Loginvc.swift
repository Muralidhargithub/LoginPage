//
//  Loginvc.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/12/24.
//

import UIKit

class Loginvc: UIViewController {
    
    @IBOutlet var emailRadius: UITextField!
    @IBOutlet var passwordRadius: UITextField!
    @IBOutlet var SigninButtonRadius: UIButton!
    var lbl: UILabel!
    var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyCornerRadius(emailRadius)
        applyCornerRadius(passwordRadius)
        applyCornerRadius(SigninButtonRadius)
        setupTextFieldAppearance(emailRadius)
        setupTextFieldAppearance(passwordRadius)
        
        // Set text field delegates
        emailRadius.delegate = self
        passwordRadius.delegate = self
    }
    
    func applyCornerRadius(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
    
    func setupTextFieldAppearance(_ view: UIView) {
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 1.0
    }
    
    @IBAction func createAcountSegue(_ sender: Any) {
        let createaccVC = storyboard?.instantiateViewController(withIdentifier: "CreateaccVC") as? CreateaccVC
        if let objCreateaccVC = createaccVC {
            navigationController?.pushViewController(objCreateaccVC, animated: true)
        }
    }
    
    @IBAction func forgot(_ sender: Any) {
        let troubleloginVC = storyboard?.instantiateViewController(withIdentifier: "TroubleLoginVC") as? TroubleLoginVC
        if let objTroubleLoginVC = troubleloginVC {
            navigationController?.pushViewController(objTroubleLoginVC, animated: true)
        }
    }
    
    @IBAction func signin(_ sender: Any) {
        validateAndNavigate()
    }
}

extension Loginvc: UITextFieldDelegate {
    
    // When "Return" key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailRadius {
            passwordRadius.becomeFirstResponder()
        } else if textField == passwordRadius {
            validateAndNavigate()
        }
        return true
    }
    
    // Validation and Navigation
    private func validateAndNavigate() {
        guard let username = emailRadius.text, !username.isEmpty else {
            showAlert(message: "Username cannot be empty")
            return
        }
        
        guard let password = passwordRadius.text, !password.isEmpty else {
            showAlert(message: "Password cannot be empty")
            return
        }
        
        // Check if the username and password match
        if username == "Murali" && password == "Kakanuru" {
            navigateToNextPage()
        } else {
            showAlert(message: "Invalid Username or Password")
        }
    }
    
    // Alert for errors
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // Navigation to the next page
    func navigateToNextPage() {
        guard let username = emailRadius.text else { return }
        let nextpage = storyboard?.instantiateViewController(withIdentifier: "mainTabVC") as? mainTabVC
        nextpage?.username = username
        if let nextPageVC = nextpage {
            navigationController?.pushViewController(nextPageVC, animated: true)
        }
    }
}
