import UIKit

class UpdateProfileController: UIViewController,UpdateProfileViewable {
    @IBOutlet weak var tableView: UITableView!
    var user: User?
    var presentar:UpdateProfilePresentar?
    static let id = String(describing: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UpdateProfileTableCell.nib()
        tableView.register(nib, forCellReuseIdentifier: UpdateProfileTableCell.id)
    }
    @IBAction func didTapDismissButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
    @IBAction func didTapSaveButton(_ sender: Any) {
        print(#function)
    }
}
extension UpdateProfileController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
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
extension UpdateProfileController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpdateProfileTableCell.id, for: indexPath) as? UpdateProfileTableCell else { fatalError()}
        guard let section = UpdateProfileSection(rawValue: indexPath.row) else { return cell }
        guard let user = user else { return cell }
        let viewData = UpdateProfileViewData(user: user, sectons: section)
        cell.viewModel = viewData
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return UpdateProfileSection.allCases.count
    }
}
