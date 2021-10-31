import UIKit

class ProfileCell: UICollectionViewCell {
    static let id = "ProfileCell"
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var letterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib()->UINib {
      return  UINib(nibName: "ProfileCell", bundle: nil)
    }

}
