import UIKit

final class LetterWhoTypeCell: UITableViewCell {
    static let id = "LetterWhoTypeCell"
    var whoType: SendWhoType! {
        didSet {
            setupUI()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    static func nib() -> UINib {
        return UINib(nibName: "LetterWhoTypeCell", bundle: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    private func setupUI() {
        self.textLabel?.text = whoType.description
    }

}
