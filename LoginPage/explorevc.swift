//
//  ExploreVC.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/16/24.
//

import UIKit

class explorevc: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()

    let detailedEvents: [Other] = [
        Other(organizationName: "Miami-Dade County Public Schools", eventTitle: "Miami-Dade County Public Schools Info Session", dateInfo: "Virtual • Thu Jan 11 2024 • 2:00 PM EST", tags: ["HIRING"]),
        Other(organizationName: "McKinsey & Company", eventTitle: "International MBA Abroad Session", dateInfo: "Virtual • Tue Apr 9 2024 • 9:00 AM EDT", tags: ["EMPLOYER INFO", "GUIDANCE"]),
        Other(organizationName: "Google Inc.", eventTitle: "Google Tech Talk", dateInfo: "Virtual • Mon Mar 1 2024 • 10:00 AM PST", tags: ["INTERNSHIPS"]),
        Other(organizationName: "Amazon", eventTitle: "AWS Career Fair", dateInfo: "Virtual • Wed Feb 20 2024 • 1:00 PM PST", tags: ["HIRING", "TECH TALK"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBar()
        setupScrollView()
    }

    func setUpNavigationBar() {
        let profileButton = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"),
                                            style: .plain,
                                            target: self,
                                            action: #selector(profileButtonTapped))
        profileButton.tintColor = .label
        let titleLabel = UILabel()
        titleLabel.text = "Explore"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textColor = .label

        let leftTitleItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItems = [profileButton, leftTitleItem]
    }

    func setupScrollView() {
        // Add scrollView to the main view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        // Add contentView to the scrollView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        // Set up constraints for scrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Set up constraints for contentView
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        // Example: Add a label to the contentView
        let exampleLabel = UILabel()
        exampleLabel.text = "Internship picks for iOS Developers"
        exampleLabel.font = UIFont.systemFont(ofSize: 16)
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(exampleLabel)

        NSLayoutConstraint.activate([
            exampleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            exampleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])

        // Add job listings to the contentView
        var previousView: UIView = exampleLabel
        for event in detailedEvents {
            let eventLabel = UILabel()
            eventLabel.text = "\(event.organizationName) - \(event.eventTitle)\n\(event.dateInfo)"
            eventLabel.font = UIFont.systemFont(ofSize: 14)
            eventLabel.numberOfLines = 0
            eventLabel.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(eventLabel)

            NSLayoutConstraint.activate([
                eventLabel.topAnchor.constraint(equalTo: previousView.bottomAnchor, constant: 20),
                eventLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
                eventLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            ])

            previousView = eventLabel
        }

        // Adjust contentView bottom constraint
        NSLayoutConstraint.activate([
            previousView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    @objc func profileButtonTapped() {
        print("Profile Button Tapped")
    }
}

struct Other {
    let organizationName: String
    let eventTitle: String
    let dateInfo: String
    let tags: [String]
}
