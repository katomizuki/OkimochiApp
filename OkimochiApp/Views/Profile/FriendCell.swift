import UIKit
import SDWebImage
final class FriendCell: UITableViewCell {

    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var frinedImageView: UIImageView! {
        didSet {
            frinedImageView.layer.cornerRadius  = 50 / 2
            frinedImageView.layer.masksToBounds = true
            frinedImageView.contentMode = .scaleAspectFill
        }
    }
    var viewData: FrinedCellViewData? {
        didSet {
            setupUI()
        }
    }
    static let id = "FriendCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib() -> UINib {
        return UINib(nibName: "FriendCell", bundle: nil)
    }

    private func setupUI() {
        friendNameLabel.attributedText = viewData?.nameAttributedText
        frinedImageView.sd_setImage(with: viewData?.user.profileUrl, completed: nil)
    }

}
