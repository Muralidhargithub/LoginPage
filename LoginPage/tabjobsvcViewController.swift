import UIKit

// Job model to represent each job posting
struct Job {
    let companyName: String
    let jobTitle: String
    let jobType: String
    let location: String
    let postTime: String
    let salary: String?
}

class TabJobsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // UI Elements
    private let searchBar = UISearchBar()
    private let filterScrollView = UIScrollView()
    private let filterStackView = UIStackView()
    private let tableView = UITableView()

    // Dummy job data
    private var jobs: [Job] = [
        Job(companyName: "IDS", jobTitle: "Data Analyst", jobType: "Full-time job", location: "Aventura, FL", postTime: "3d ago", salary: nil),
        Job(companyName: "TipTop Technologies, Inc.", jobTitle: "Data Science Intern", jobType: "Internship", location: "Remote", postTime: "3d ago", salary: "$16-40/hr"),
        Job(companyName: "Soma Reality", jobTitle: "Business Analyst", jobType: "Full-time job", location: "Remote", postTime: "1w ago", salary: "$85-95K/yr"),
        Job(companyName: "TechCorp Solutions", jobTitle: "Software Engineer", jobType: "Full-time job", location: "San Francisco, CA", postTime: "2d ago", salary: "$100-120K/yr"),
        // ... [Add all other jobs here as needed] ...
        Job(companyName: "GlobalTech", jobTitle: "Backend Developer", jobType: "Full-time job", location: "Remote", postTime: "3d ago", salary: "$90-115K/yr")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        tableView.reloadData()  // Ensures table view reloads all data on view load
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        setupSearchBar()
        setupFilterScrollView()
        setupTableView()
    }

    private func setupSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func setupFilterScrollView() {
        filterScrollView.translatesAutoresizingMaskIntoConstraints = false
        filterScrollView.showsHorizontalScrollIndicator = false
        view.addSubview(filterScrollView)

        filterStackView.axis = .horizontal
        filterStackView.spacing = 10
        filterStackView.translatesAutoresizingMaskIntoConstraints = false
        filterScrollView.addSubview(filterStackView)

        let filterTitles = ["Type of Role", "Location", "Onsite/Remote", "Full-time", "Part-time", "Interns"]
        filterTitles.forEach { title in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.backgroundColor = .lightGray.withAlphaComponent(0.2)
            button.layer.cornerRadius = 15
            button.setTitleColor(.black, for: .normal)
            button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
            filterStackView.addArrangedSubview(button)
        }

        NSLayoutConstraint.activate([
            filterScrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            filterScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            filterScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            filterScrollView.heightAnchor.constraint(equalToConstant: 40),

            filterStackView.topAnchor.constraint(equalTo: filterScrollView.topAnchor),
            filterStackView.bottomAnchor.constraint(equalTo: filterScrollView.bottomAnchor),
            filterStackView.leadingAnchor.constraint(equalTo: filterScrollView.leadingAnchor),
            filterStackView.trailingAnchor.constraint(equalTo: filterScrollView.trailingAnchor),
            filterStackView.heightAnchor.constraint(equalTo: filterScrollView.heightAnchor)
        ])
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(JobCell.self, forCellReuseIdentifier: "JobCell")
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: filterScrollView.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as? JobCell else {
            return UITableViewCell()
        }
        cell.configure(with: jobs[indexPath.row])
        return cell
    }

    // MARK: - Custom UITableViewCell
    class JobCell: UITableViewCell {
        private let companyLabel = UILabel()
        private let jobTitleLabel = UILabel()
        private let jobTypeLabel = UILabel()
        private let locationLabel = UILabel()
        private let postTimeLabel = UILabel()
        private let salaryLabel = UILabel()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCell()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        private func setupCell() {
            companyLabel.font = .boldSystemFont(ofSize: 16)
            jobTitleLabel.font = .systemFont(ofSize: 14)
            jobTypeLabel.font = .systemFont(ofSize: 12)
            locationLabel.font = .systemFont(ofSize: 12)
            postTimeLabel.font = .systemFont(ofSize: 12)
            salaryLabel.font = .systemFont(ofSize: 12)
            salaryLabel.textColor = .gray

            let stackView = UIStackView(arrangedSubviews: [companyLabel, jobTitleLabel, jobTypeLabel, locationLabel, salaryLabel, postTimeLabel])
            stackView.axis = .vertical
            stackView.spacing = 5
            stackView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(stackView)

            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
                stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
                stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
        }

        func configure(with job: Job) {
            companyLabel.text = job.companyName
            jobTitleLabel.text = job.jobTitle
            jobTypeLabel.text = job.jobType
            locationLabel.text = job.location
            postTimeLabel.text = job.postTime
            salaryLabel.text = job.salary ?? ""
        }
    }
}
