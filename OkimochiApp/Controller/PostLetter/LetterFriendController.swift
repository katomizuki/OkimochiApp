import UIKit

class LetterFriendController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let navItem = UINavigationItem(title: "")
        navItem.leftBarButtonItem = UIBarButtonItem(title: "もどる", style: .done, target: self, action: #selector(didTapDismissButton))
        navigationBar.pushItem(navItem, animated: true)
        navigationBar.barTintColor = .white
    }
    private func setupTableView() {
        print(#function)
        tableView.delegate = self
        tableView.dataSource = self
        let nib = FriendCell.nib()
        tableView.register(nib, forCellReuseIdentifier: FriendCell.id)
    }
    @objc private func didTapDismissButton() {
        print(#function)
        dismiss(animated: true, completion: nil)
    }

}
// MARK: - UITableViewDelegate
extension LetterFriendController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
// MARK: - UITableViewDataSource
extension LetterFriendController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.id, for: indexPath) as? FriendCell else { fatalError() }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}
