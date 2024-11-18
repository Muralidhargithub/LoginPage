import UIKit

class Feedtabvc: UIViewController {

    @IBOutlet var dataSource: UITableView!
    
    // Sample data model to populate the table view
    let songs = [
        Song(title: "The Kids Aren’t Alright (Remix)", subtitle: "Fall Out Boy - The Kids Aren't Alright", imageName: "song1"),
        Song(title: "Sorry", subtitle: "Justin Bieber - Sorry - Single", imageName: "song2"),
        Song(title: "Turn Your Love", subtitle: "Half Moon Run - Sun Leads Me On", imageName: "song3"),
        Song(title: "Flesh Without Blood", subtitle: "Grimes - Flesh Without Blood - Single", imageName: "song4"),
        Song(title: "The Kids Aren’t Alright (Remix)", subtitle: "Fall Out Boy - The Kids Aren't Alright", imageName: "song1"),
        Song(title: "Sorry", subtitle: "Justin Bieber - Sorry - Single", imageName: "song2"),
        Song(title: "Turn Your Love", subtitle: "Half Moon Run - Sun Leads Me On", imageName: "song3"),
        Song(title: "Flesh Without Blood", subtitle: "Grimes - Flesh Without Blood - Single", imageName: "song4"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.dataSource = self
    }
}

extension Feedtabvc: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Attempt to dequeue the reusable cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        
        let song = songs[indexPath.row]
        
        // Configure the attributed text for titleLabel
        let fullText = "\(song.title)\n\(song.subtitle)"
        let attributedText = NSMutableAttributedString(string: fullText)

        // Set the attributes for the song title (make it bold)
        let titleRange = (fullText as NSString).range(of: song.title)
        attributedText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 16), range: titleRange)

        // Set the attributes for the song subtitle (smaller and lighter)
        let subtitleRange = (fullText as NSString).range(of: song.subtitle)
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 14), range: subtitleRange)
        attributedText.addAttribute(.foregroundColor, value: UIColor.gray, range: subtitleRange)

        // Assign the formatted text to the label
        cell.titleLabel.attributedText = attributedText
        cell.titleLabel.numberOfLines = 0 // Allow multiple lines to be shown

        // Set the song image view to use the "music.note" symbol from SF Symbols
        cell.songImageView.image = UIImage(systemName: "music.note")
        cell.songImageView.tintColor = .gray // Optional: Set the tint color to gray for a consistent look

        // Set the moreOptionsButton to show the "..." icon
        cell.moreOptionButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        cell.moreOptionButton.tintColor = .gray // Optional: Set the tint color for the button

        return cell
    }
}

// Sample data model for the songs
struct Song {
    let title: String
    let subtitle: String
    let imageName: String
}
