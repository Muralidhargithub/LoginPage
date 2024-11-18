//
//  CustomCell.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/18/24.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var moreOptionButton: UIButton!
    @IBOutlet var songImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        songImageView.layer.cornerRadius = 5
        songImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
