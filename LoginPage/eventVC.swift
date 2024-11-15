import UIKit

class eventVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Sample events
    let gridEvents: [Event] = [
        Event(organizationName: "Career fairs at your school", eventTitle: "", dateInfo: "", tags: []),
        Event(organizationName: "Career center employer events", eventTitle: "", dateInfo: "", tags: []),
        Event(organizationName: "Career center guidance events", eventTitle: "", dateInfo: "", tags: []),
        Event(organizationName: "Events hosted by employers", eventTitle: "", dateInfo: "", tags: [])
    ]
    
    let detailedEvents: [Event] = [
        Event(organizationName: "Miami-Dade County Public Schools", eventTitle: "Miami-Dade County Public Schools Info Session", dateInfo: "Virtual • Thu Jan 11 2024 • 2:00 PM EST", tags: ["HIRING"]),
        Event(organizationName: "McKinsey & Company", eventTitle: "International MBA Abroad Session", dateInfo: "Virtual • Tue Apr 9 2024 • 9:00 AM EDT", tags: ["EMPLOYER INFO", "GUIDANCE"]),
        Event(organizationName: "Google Inc.", eventTitle: "Google Tech Talk", dateInfo: "Virtual • Mon Mar 1 2024 • 10:00 AM PST", tags: ["INTERNSHIPS"]),
        Event(organizationName: "Amazon", eventTitle: "AWS Career Fair", dateInfo: "Virtual • Wed Feb 20 2024 • 1:00 PM PST", tags: ["HIRING", "TECH TALK"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUnderline()
        setupScrollViewWithButtons()
        setupScrollUnderline()
        setupCollectionView()
        setupEventsHeading()
        setupTableView()
    }

    func setupNavigationBar() {
        let profileButton = UIBarButtonItem(
            image: UIImage(systemName: "person.crop.circle"),
            style: .plain,
            target: self,
            action: #selector(profileButtonTapped)
        )
        profileButton.tintColor = .label

        let titleLabel = UILabel()
        titleLabel.text = "Events"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        titleLabel.textColor = .label

        let leftTitleItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.leftBarButtonItems = [profileButton, leftTitleItem]

        let calendarButton = UIBarButtonItem(
            image: UIImage(systemName: "calendar"),
            style: .plain,
            target: self,
            action: #selector(calendarButtonTapped)
        )

        let tickMarkButton = UIBarButtonItem(
            image: UIImage(systemName: "checkmark.circle"),
            style: .plain,
            target: self,
            action: #selector(tickMarkButtonTapped)
        )

        navigationItem.rightBarButtonItems = [tickMarkButton, calendarButton]
    }

    func setupUnderline() {
        let underlineView = UIView()
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = .lightGray
        view.addSubview(underlineView)

        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 3),
            underlineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            underlineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            underlineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func setupScrollViewWithButtons() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 50)
        ])

        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])

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

            if let previousButton = previousButton {
                button.leadingAnchor.constraint(equalTo: previousButton.trailingAnchor, constant: 16).isActive = true
            } else {
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
            }

            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
            previousButton = button
        }

        if let previousButton = previousButton {
            previousButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        }
    }

    func setupScrollUnderline() {
        let scrollUnderlineView = UIView()
        scrollUnderlineView.translatesAutoresizingMaskIntoConstraints = false
        scrollUnderlineView.backgroundColor = .lightGray
        view.addSubview(scrollUnderlineView)

        NSLayoutConstraint.activate([
            scrollUnderlineView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            scrollUnderlineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollUnderlineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollUnderlineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: "EventCell")

        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.heightAnchor.constraint(equalToConstant: 180) // Reduced height for more space
        ])
    }

    func setupEventsHeading() {
        let eventsHeading = UILabel()
        eventsHeading.translatesAutoresizingMaskIntoConstraints = false
        eventsHeading.text = "All Events"
        eventsHeading.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        eventsHeading.textColor = .label

        view.addSubview(eventsHeading)

        NSLayoutConstraint.activate([
            eventsHeading.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300), // Position below collection view
            eventsHeading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eventsHeading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }

    func setupTableView() {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "EventCell")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 330), // Position below "All Events" heading
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gridEvents.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EventCell", for: indexPath) as! EventCollectionViewCell
        cell.configure(with: gridEvents[indexPath.item])
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 16) / 2 // Two items per row with spacing
        return CGSize(width: width, height: 150)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailedEvents.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventTableViewCell
        cell.configure(with: detailedEvents[indexPath.row])
        return cell
    }

    // MARK: - Actions

    @objc func calendarButtonTapped() {
        print("Calendar button tapped")
    }

    @objc func tickMarkButtonTapped() {
        print("Tick mark button tapped")
    }

    @objc func profileButtonTapped() {
        print("Profile button tapped")
    }

    @objc func filterButtonTapped(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            print("\(title) button tapped")
        }
    }
}

// MARK: - Event Model

struct Event {
    let organizationName: String
    let eventTitle: String
    let dateInfo: String
    let tags: [String]
}

// MARK: - EventTableViewCell

class EventTableViewCell: UITableViewCell {

    private let organizationLabel = UILabel()
    private let eventTitleLabel = UILabel()
    private let dateInfoLabel = UILabel()
    private let tagsStackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        organizationLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        eventTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        dateInfoLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        dateInfoLabel.textColor = .gray

        [organizationLabel, eventTitleLabel, dateInfoLabel, tagsStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }

        tagsStackView.axis = .horizontal
        tagsStackView.spacing = 8

        NSLayoutConstraint.activate([
            organizationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            organizationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            organizationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            eventTitleLabel.topAnchor.constraint(equalTo: organizationLabel.bottomAnchor, constant: 4),
            eventTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            eventTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            dateInfoLabel.topAnchor.constraint(equalTo: eventTitleLabel.bottomAnchor, constant: 4),
            dateInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            dateInfoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            tagsStackView.topAnchor.constraint(equalTo: dateInfoLabel.bottomAnchor, constant: 8),
            tagsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            tagsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            tagsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func configure(with event: Event) {
        organizationLabel.text = event.organizationName
        eventTitleLabel.text = event.eventTitle
        dateInfoLabel.text = event.dateInfo

        tagsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        for tag in event.tags {
            let tagLabel = UILabel()
            tagLabel.text = tag
            tagLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            tagLabel.textColor = .white
            tagLabel.backgroundColor = .systemBlue
            tagLabel.layer.cornerRadius = 5
            tagLabel.layer.masksToBounds = true
            tagLabel.textAlignment = .center
            tagLabel.translatesAutoresizingMaskIntoConstraints = false
            tagLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
            tagLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 50).isActive = true
            tagsStackView.addArrangedSubview(tagLabel)
        }
    }
}

// MARK: - EventCollectionViewCell

class EventCollectionViewCell: UICollectionViewCell {
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 5

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2

        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    func configure(with event: Event) {
        titleLabel.text = event.organizationName
    }
}
