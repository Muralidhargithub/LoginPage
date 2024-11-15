//
//  mailTabVC.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/13/24.
//

import UIKit

class mailTabVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    func setupNavigationBar() {
        // Create profile button using SF Symbol directly
        let profileButton = UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle"), // Use SF Symbols
            style: .plain,
            target: self,
            action: #selector(profileButtonTapped)
        )
        profileButton.tintColor = .label // Adapts to light/dark mode

        // Create custom title label
        let titleLabel = UILabel()
        titleLabel.text = "Events"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textColor = .label

        // Set profile button and title label as left bar button items
        let leftTitleItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItems = [profileButton, leftTitleItem]

        // Create calendar button
        let calendarButton = UIBarButtonItem(
            image: UIImage(systemName: "calendar"), // Use SF Symbols
            style: .plain,
            target: self,
            action: #selector(calendarButtonTapped)
        )

        // Create tick mark button
        let tickMarkButton = UIBarButtonItem(
            image: UIImage(systemName: "checkmark.circle"), // Use SF Symbols
            style: .plain,
            target: self,
            action: #selector(tickMarkButtonTapped)
        )

        // Add buttons to navigation bar
        navigationItem.rightBarButtonItems = [tickMarkButton, calendarButton]
    }

    // Action for calendar button
    @objc func calendarButtonTapped() {
        print("Calendar button tapped")
    }

    // Action for tick mark button
    @objc func tickMarkButtonTapped() {
        print("Tick mark button tapped")
    }

    // Action for profile button
    @objc func profileButtonTapped() {
        print("Profile button tapped")
    }
}


