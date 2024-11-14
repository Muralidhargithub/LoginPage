//
//  mailTabVC.swift
//  LoginPage
//
//  Created by Muralidhar reddy Kakanuru on 11/13/24.
//

import UIKit

class mailTabVC: UIViewController {

    @IBOutlet var searchButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        radiusCorner(searchButton)
        setUPBordercolor(searchButton)

        // Do any additional setup after loading the view.
    }
    func radiusCorner(_ view:UIView){
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }
    
    func setUPBordercolor(_ view:UIView){
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    
    func setUpSearchButton(){
        searchButton.setTitle("Search", for: .normal)
        if let searchIcon = UIImage(named: "MagnifyingGlass"){
            searchButton.setImage(searchIcon, for: .normal)
        }
            
            searchButton.tintColor = .gray // Set icon color
            searchButton.setTitleColor(.darkGray, for: .normal) // Set text color
            
            // Set image and title spacing
            searchButton.tintColor = .gray // Color for icon
                    searchButton.contentHorizontalAlignment = .left // Align content to the left
                    searchButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0) // Space icon from left edge
                    searchButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0) // Space text from icon
        }
    }
            
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

