import UIKit

class ProfileOptionsCell: UICollectionViewCell {
    
    @IBOutlet weak var optionsLabel: UILabel!
    static let id = "ProfileOptionsCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func nib()->UINib {
        return UINib(nibName: "ProfileOptionsCell", bundle: nil)
    }

}
