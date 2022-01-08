import Foundation
import UIKit
import SDWebImage
protocol ProfileHeaderDelegate: AnyObject {
    func didTapUpdateButton()
    func didTapProfileOptionsButton(_ selectOptions: ProfileFilterOptions)
}
class ProfileHeader: UICollectionReusableView {
    // MARK: - Properties
    static let id = String(describing: self)
    weak var delegate:ProfileHeaderDelegate?
    var viewData:ProfileHeaderViewData? {
        didSet {
            setupUI()
        }
    }
    @IBOutlet weak var profileImageView: UIImageView! {
        didSet {
            profileImageView.layer.cornerRadius = 35
            profileImageView.layer.masksToBounds = true
            profileImageView.contentMode = .scaleAspectFill
        }
    }
    @IBOutlet weak var orangeUnderLineConstaraint: NSLayoutConstraint!
    private let underLine:UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var pastSeenButton: UIButton!
    @IBOutlet weak var myInfoButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    //　カスタムクラスに指定しているためinitは使えない。requiredinitは呼ばれる。why?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    static func nib()->UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    @IBAction func didTapUpdateButton(_ sender: Any) {
        print(#function)
        self.delegate?.didTapUpdateButton()
    }
    @IBAction func didTapOptionsButton(_ sender: UIButton) {
        let width = UIScreen.main.bounds.width
        print(#function)
            switch sender {
            case myInfoButton:
                UIView.animate(withDuration: 0.5) {
                    self.orangeUnderLineConstaraint.constant = width * 2 / 3
                }
                myInfoButton.tintColor = .systemOrange
                pastSeenButton.tintColor = .systemGray
                favButton.tintColor = .systemGray
                self.delegate?.didTapProfileOptionsButton(.info)
            case pastSeenButton:
                UIView.animate(withDuration: 0.5) {
                    self.orangeUnderLineConstaraint.constant = width * 1 / 3
                }
                pastSeenButton.tintColor = .systemOrange
                myInfoButton.tintColor = .systemGray
                favButton.tintColor = .systemGray
                self.delegate?.didTapProfileOptionsButton(.past)
            case favButton:
                UIView.animate(withDuration: 0.5) {
                self.orangeUnderLineConstaraint.constant = 0
            }
                favButton.tintColor = .systemOrange
                myInfoButton.tintColor = .systemGray
                pastSeenButton.tintColor = .systemGray
                self.delegate?.didTapProfileOptionsButton(.fav)
            default: break
        }
    }
    private func setupUI() {
        nameLabel.text = viewData?.user.name
        profileImageView.sd_setImage(with: viewData?.user.profileUrl, completed: nil)
    }
}
