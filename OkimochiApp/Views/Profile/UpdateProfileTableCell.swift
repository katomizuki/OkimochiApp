
import UIKit

class UpdateProfileTableCell: UITableViewCell {
    static let id = "UpdateProfileTableCell"
    var viewModel:UpdateProfileViewModel? {
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
//        backgroundColor = .systemPurple
    }
    static func nib()->UINib {
        return UINib(nibName: "UpdateProfileTableCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    private func setupUI() {
        print(#function)
    }
    
}
