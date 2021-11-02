import UIKit

class SearchFriendsController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupTableView()
    }
    // MARK: - SetupMethod
    private func setupSearchController() {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = false
        if #available(iOS 11.0, *) {
            navigationItem.searchController = controller
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = FriendCell.nib()
        tableView.register(nib, forCellReuseIdentifier: FriendCell.id)
        tableView.rowHeight = 80
    }
    


}
// MARK: - UISearchResultsUpdating
extension SearchFriendsController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
    }
}
// MARK: - UITableViewDelegate
extension SearchFriendsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        performSegue(withIdentifier: "FriedDetailController", sender: nil)
    }
}
// MARK: - UITableViewDataSource
extension SearchFriendsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.id, for: indexPath) as? FriendCell else { fatalError() }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
