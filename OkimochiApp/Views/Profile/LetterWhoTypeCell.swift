import UIKit

class LetterWhoTypeCell: UITableViewCell {
    static let id = "LetterWhoTypeCell"
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    static func nib()->UINib {
        return UINib(nibName: "LetterWhoTypeCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
