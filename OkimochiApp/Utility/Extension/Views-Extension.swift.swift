import Foundation
import UIKit

extension UIViewController {
    func updateLeftView(_ textField: UITextField,imagename: String) {
        let imageView = UIImageView()
        let leftView = UIView()
        leftView.setDimensions(height: 40, width: 40)
        textField.leftView = leftView
        textField.leftViewMode = .always
        let image = UIImage(systemName: imagename)
        imageView.image = image
        imageView.tintColor = .systemOrange
        leftView.addSubview(imageView)
        imageView.setDimensions(height: 40, width: 40)
    }
    func updateAuthAttibutedString(explain: String, pageName: String)->NSMutableAttributedString {
        let attibutedString = NSMutableAttributedString(string: "\(explain)\n",
                                                 attributes: [.font : UIFont.systemFont(ofSize: 14),.foregroundColor:UIColor.systemGray])
        attibutedString.append(NSAttributedString(string: pageName,
                                                  attributes: [.font : UIFont.boldSystemFont(ofSize: 14),.foregroundColor:UIColor.systemGray]))
        return attibutedString
    }
}
