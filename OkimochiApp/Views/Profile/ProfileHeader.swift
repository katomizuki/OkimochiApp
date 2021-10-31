
import Foundation
import UIKit
class ProfileHeader: UICollectionReusableView {
    private let profileFileter = ProfileFilter(frame: .zero)
    static let id = "ProfileHeader"
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = 35
            profileImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(profileFileter)
        profileFileter.anchor(top: updateButton.bottomAnchor,
                              left: leftAnchor,
                              right: rightAnchor,
                              paddingTop: 0,
                              paddingLeft:0,
                              paddingBottom: 10,
                              paddingRight: 0)
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    static func nib()->UINib {
        return UINib(nibName: "ProfileHeader", bundle: nil)
    }
    @IBAction func didTapUpdateButton(_ sender: Any) {
        print(#function)
        print(profileFileter)
    }
}
