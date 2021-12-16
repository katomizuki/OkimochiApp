import UIKit

class ProfileCell: UICollectionViewCell {
    static let id = "ProfileCell"
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView! {
        didSet {
            friendImageView.layer.cornerRadius = 60 / 2
            friendImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var letterImageView: UIImageView!
    var viewModel:ProfileViewData? {
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib()->UINib {
      return  UINib(nibName: "ProfileCell", bundle: nil)
    }
    private func setupUI() {
        guard let viewModel = viewModel else {
            return
        }
        switch viewModel.options {
        case .fav:
            print("fav")
        case .past:
            print("past")
            
        case .info:
            print("info")
            timeLabel.isHidden = true
            titleLabel.isHidden = true
            letterImageView.isHighlighted = true
            friendImageView.isHidden = false
    }
  }
}
