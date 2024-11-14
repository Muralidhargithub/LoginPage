//
//  jobsVC.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/12/24.
//

import UIKit

class jobsVC: UIViewController {

    @IBOutlet var searchButton: UIButton! // Keep as UIButton if you need it as a button
    @IBOutlet var roleType: UIButton!
    @IBOutlet var location: UIButton!
    @IBOutlet var partTime: UIButton!
    @IBOutlet var fullTime: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyCornerRadius(searchButton)
        applyCornerRadius(roleType)
        applyCornerRadius(partTime)
        applyCornerRadius(fullTime)
        setupTextFieldAppearance(roleType)
        setupTextFieldAppearance(partTime)
        setupTextFieldAppearance(fullTime)
        
        setupSearchButton()
    }
    
    func applyCornerRadius(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
    func setupTextFieldAppearance(_ view:UIView) {
        // Set the default border color and width
        view.layer.borderColor = UIColor.black.cgColor // Default color
        view.layer.borderWidth = 1.0 // Set border width
    }
    
    func setupSearchButton() {
        // Set button title
        searchButton.setTitle("Search", for: .normal)
        
        // Set button image
        if let searchIcon = UIImage(systemName: "magnifyingglass") {
            searchButton.setImage(searchIcon, for: .normal)
        }
        
        // Adjust the position and spacing of image and title
        searchButton.tintColor = .gray // Set icon color
        searchButton.setTitleColor(.darkGray, for: .normal) // Set text color
        
        // Set image and title spacing
        searchButton.tintColor = .gray // Color for icon
                searchButton.contentHorizontalAlignment = .left // Align content to the left
                searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0) // Space icon from left edge
                searchButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0) // Space text from icon
    }
}
