import UIKit

class FriendCell: UITableViewCell {
 
    @IBOutlet weak var friendNameLabel: UILabel!
    @IBOutlet weak var frinedImageView: UIImageView! {
        didSet {
            frinedImageView.layer.cornerRadius  = 50 / 2
            frinedImageView.layer.masksToBounds = true
        }
    }
    static let id = "FriendCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    static func nib()->UINib{
        return UINib(nibName: "FriendCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
