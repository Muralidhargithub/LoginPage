import UIKit

class textvc: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupTextFieldAppearance()
    }

    private func setupTextFieldAppearance() {
        // Set the default border color and width
        self.layer.borderColor = UIColor.orange.cgColor // Default color
        self.layer.borderWidth = 1.0 // Set border width
        self.layer.cornerRadius = 10.0 // Round the corners
        self.clipsToBounds = true
    }

    // Highlight the border color when the text field becomes active
    override func becomeFirstResponder() -> Bool {
        let isFirstResponder = super.becomeFirstResponder()
        if isFirstResponder {
            self.layer.borderColor = UIColor.blue.cgColor // Highlight color
            self.layer.borderWidth = 2.0 // Optional: increase width when focused
        }
        return isFirstResponder
    }

    // Reset the border color when the text field resigns focus
    override func resignFirstResponder() -> Bool {
        let isResigningFirstResponder = super.resignFirstResponder()
        if isResigningFirstResponder {
            self.layer.borderColor = UIColor.orange.cgColor // Default color
            self.layer.borderWidth = 1.0 // Reset width
        }
        return isResigningFirstResponder
    }
}
