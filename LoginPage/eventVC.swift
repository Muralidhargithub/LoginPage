import UIKit

class eventVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUnderline()
        setupScrollViewWithButtons()
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

    func setupUnderline() {
        // Create an underline view
        let underlineView = UIView()
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .lightGray

        // Add the underline view to the main view
        view.addSubview(underlineView)

        // Set up constraints for the underline view
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 03), // Adjust the constant if necessary
            underlineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 1) // Adjust the height as desired
        ])
    }

    func setupScrollViewWithButtons() {
        // Create a horizontal scroll view
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)

        // Set constraints for the scroll view
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 05), // Position below underline
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 50)
        ])

        // Create a content view to hold the buttons
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        // Set constraints for the content view
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

        // Create buttons and add them to the content view
        let buttonTitles = ["Search", "Sort", "Category", "Medium", "Date", "More Filters"]
        let buttonIcons = ["magnifyingglass", "arrow.up.arrow.down", "", "", "", "line.horizontal.3.decrease"]

        var previousButton: UIButton? = nil

        for (index, title) in buttonTitles.enumerated() {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(title, for: .normal)
            if !buttonIcons[index].isEmpty {
                button.setImage(UIImage(systemName: buttonIcons[index]), for: .normal)
            }
            button.tintColor = .systemBlue
            button.addTarget(self, action: #selector(filterButtonTapped(_:)), for: .touchUpInside)

            contentView.addSubview(button)

            // Set button constraints
            if let previousButton = previousButton {
                button.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor, constant: 16).isActive = true
            } else {
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            }
            
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

            previousButton = button
        }

        // Set trailing constraint of the last button to the content view
        if let previousButton = previousButton {
            previousButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        }
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

    // Action for filter buttons in the scroll view
    @objc func filterButtonTapped(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            print("\(title) button tapped")
        }
    }
}
