import UIKit

class ProfileOptionsCell: UICollectionViewCell {
    var options: ProfileFilterOptions? {
        didSet {
            optionsLabel.text = options?.description
        }
    }
    @IBOutlet private weak var optionsLabel: UILabel!
    static let id = "ProfileOptionsCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib()->UINib {
        return UINib(nibName: "ProfileOptionsCell", bundle: nil)
    }

}
