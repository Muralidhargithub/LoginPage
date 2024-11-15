
import UIKit

// Job model to represent each job posting
struct JobPosting {
    let companyName: String
    let jobTitle: String
    let jobType: String
    let location: String
    let postTime: String
    let salary: String?
}

class jobsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // UI Elements
    let searchBar = UISearchBar()
    let filterScrollView = UIScrollView()
    let filterStackView = UIStackView()
    let tableView = UITableView()
    
    // Dummy job data
    var jobs: [Job] = [
        Job(companyName: "IDS", jobTitle: "Data Analyst", jobType: "Full-time job", location: "Aventura, FL", postTime: "3d ago", salary: nil),
        Job(companyName: "TipTop Technologies, Inc.", jobTitle: "Data Science Intern", jobType: "Internship", location: "Remote", postTime: "3d ago", salary: "$16-40/hr"),
        Job(companyName: "Soma Reality", jobTitle: "Business Analyst", jobType: "Full-time job", location: "Remote", postTime: "1w ago", salary: "$85-95K/yr"),
        Job(companyName: "Innovative Partners", jobTitle: "Data Analyst", jobType: "Full-time job", location: "Coral Springs, FL", postTime: "1w ago", salary: "$60-75K/yr"),
        Job(companyName: "Soma Reality", jobTitle: "Data Analyst", jobType: "Full-time job", location: "Remote", postTime: "1w ago", salary: "$60-75K/yr")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSearchBar()
        setupFilterScrollView()
        setupTableView()
    }
    
    func setupSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal

        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupFilterScrollView() {
        filterScrollView.translatesAutoresizingMaskIntoConstraints = false
        filterScrollView.showsHorizontalScrollIndicator = false
        view.addSubview(filterScrollView)
        
        filterStackView.axis = .horizontal
        filterStackView.spacing = 10
        filterStackView.distribution = .fillProportionally
        filterStackView.translatesAutoresizingMaskIntoConstraints = false
        filterScrollView.addSubview(filterStackView)
        
        let filterTitles = ["Type of Role", "Location", "Onsite/remote", "Full-time", "Part-time", "Interns"]
        for title in filterTitles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.layer.cornerRadius = 15
            button.backgroundColor = .lightGray.withAlphaComponent(0.2)
            button.setTitleColor(.black, for: .normal)
            button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
            filterStackView.addArrangedSubview(button)
        }
        
        NSLayoutConstraint.activate([
            filterScrollView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            filterScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            filterScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            filterScrollView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            filterStackView.topAnchor.constraint(equalTo: filterScrollView.topAnchor),
            filterStackView.bottomAnchor.constraint(equalTo: filterScrollView.bottomAnchor),
            filterStackView.leadingAnchor.constraint(equalTo: filterScrollView.leadingAnchor),
            filterStackView.trailingAnchor.constraint(equalTo: filterScrollView.trailingAnchor),
            filterStackView.heightAnchor.constraint(equalTo: filterScrollView.heightAnchor)
        ])
    }
    
    func setupTableView() {
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
    
    // UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell", for: indexPath) as! JobCell
        let job = jobs[indexPath.row]
        cell.configure(with: job)
        return cell
    }
    
    // Custom UITableViewCell inside JobsViewController
    class JobCell: UITableViewCell {
        let companyLabel = UILabel()
        let jobTitleLabel = UILabel()
        let jobTypeLabel = UILabel()
        let locationLabel = UILabel()
        let postTimeLabel = UILabel()
        let salaryLabel = UILabel()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupCell()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupCell() {
            companyLabel.font = UIFont.boldSystemFont(ofSize: 16)
            jobTitleLabel.font = UIFont.systemFont(ofSize: 14)
            jobTypeLabel.font = UIFont.systemFont(ofSize: 12)
            locationLabel.font = UIFont.systemFont(ofSize: 12)
            postTimeLabel.font = UIFont.systemFont(ofSize: 12)
            salaryLabel.font = UIFont.systemFont(ofSize: 12)
            salaryLabel.textColor = .gray
            
            let stackView = UIStackView(arrangedSubviews: [companyLabel, jobTitleLabel, jobTypeLabel, locationLabel, salaryLabel, postTimeLabel])
            stackView.axis = .vertical
            stackView.spacing = 5
            contentView.addSubview(stackView)
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
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
