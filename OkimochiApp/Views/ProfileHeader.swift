
import Foundation
import UIKit
class ProfileHeader: UICollectionReusableView {
    
    static let id = "ProfileHeader"
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = 35
            profileImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib()->UINib {
        return UINib(nibName: "ProfileHeader", bundle: nil)
    }
    @IBAction func didTapUpdateButton(_ sender: Any) {
        print(#function)
    }
}
