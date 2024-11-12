import UIKit

class labelVC: UILabel {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Set the corner radius
        self.layer.cornerRadius = 8 // Adjust this value as needed
        self.clipsToBounds = true // Ensures the content is clipped within rounded corners
    }
}
