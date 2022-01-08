
import UIKit

class UpdateProfileTableCell: UITableViewCell {
    static let id = String(describing: self)
    var viewData:UpdateProfileViewData? {
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib()->UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    private func setupUI() {
        print(#function)
        
    }
    
}
