import UIKit
import SDWebImage
final class FriendDetailController: UIViewController {
    static let id = String(describing: FriendDetailController.self)
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView! {
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
    @IBAction func didTapDismissButton(_ sender: Any) {
        print(#function)
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapPlusFrinedButton(_ sender: Any) {
        print(#function)
    }
    private func setupUI() {
        nameLabel.text = user?.name
        friendImageView.sd_setImage(with: user?.profileUrl, completed: nil)
    }

}
extension FriendDetailController: FriendsDetailViewable {
    func showError() {

    }

}
