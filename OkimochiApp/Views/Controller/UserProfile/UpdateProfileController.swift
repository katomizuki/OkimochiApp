import UIKit

final class UpdateProfileController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    var user: User? {
        didSet {
            guard let user = user else { return }
            dataSource.initUserData(user)
        }
    }
    var presentar: UpdateProfilePresentable?
    static let id = String(describing: UpdateProfileController.self)
    private let dataSource = UpdateProfileTableViewManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.register(UpdateProfileTableCell.nib(), forCellReuseIdentifier: UpdateProfileTableCell.id)
    }

    @IBAction private func didTapDismissButton(_ sender: Any) {
        presentar?.onTapDismissButton()
    }

    @IBAction private func didTapSaveButton(_ sender: Any) {
        presentar?.onTapSaveButton(user: User(dic: [:]))
    }
}
extension UpdateProfileController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // セルをタップした時
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    private func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle = UpdateProfileSection(rawValue: section)?.description
        return sectionTitle
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .systemOrange
    }
}
extension UpdateProfileController: UpdateProfileViewable {
    func showError() {
        // エラー処理
    }
    func updateUserInfo() {
        // 更新したユーザー情報が入る
    }
    func setViewData(_ viewData: UserViewData) {
        // 最初取ってくる。
    }
}
