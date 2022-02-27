import UIKit
import SDWebImage
final class FriendDetailController: UIViewController {
    static let id = String(describing: FriendDetailController.self)
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!
    var presentar: FriendDetailPresentable?
    @IBOutlet private weak var friendImageView: UIImageView! {
        didSet {
            friendImageView.layer.cornerRadius = 75
            friendImageView.layer.masksToBounds = true
        }
    }
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    @IBAction private func didTapDismissButton(_ sender: Any) {
        presentar?.onTapDismissButton()
    }

    @IBAction private func didTapPlusFrinedButton(_ sender: Any) {
        presentar?.onApplyFriendButton()
    }

    private func setupUI() {
        nameLabel.text = user?.name
        friendImageView.sd_setImage(with: user?.profileUrl, completed: nil)
    }

}
extension FriendDetailController: FriendsDetailViewable {
    func setFriendViewData(_ viewData: FreindDetailViewData) {
        // ViewDataでUI更新処理
    }

    func showError() {
        //　エラー処理
    }

}
