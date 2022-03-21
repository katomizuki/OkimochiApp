import UIKit

final class SearchFriendsController: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var tableView: UITableView!
    private var searchController = UISearchController(searchResultsController: nil)
    private var isSearched: Bool {
        return searchController.searchBar.text?.isEmpty == false
    }
    private var users = [User]()
    private var filterUsers = [User]()
    private var selectedIndex = Int()
    static let id = String(describing: SearchFriendsController.self)
    var presentar: SearchFriendPresentable?
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presentar?.viewDidLoad()
        setupSearchController()
        setupTableView()
    }
    // MARK: - SetupMethod
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = true
        }
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FriendCell.nib(), forCellReuseIdentifier: FriendCell.id)
        tableView.rowHeight = 80
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriedDetailController" {
            let controller = segue.destination as! FriendDetailController
            let user = isSearched ? filterUsers[selectedIndex] : users[selectedIndex]
            controller.user = user
        }
    }
}
// MARK: - UISearchResultsUpdating
extension SearchFriendsController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
        guard let text = searchController.searchBar.text else { return }
        filterUsers = users.filter({ $0.name.contains(text) })
        tableView.reloadData()
    }
}
// MARK: - UITableViewDelegate
extension SearchFriendsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        selectedIndex = indexPath.row
        presentar?.onTapCell()
    }
}
// MARK: - UITableViewDataSource
extension SearchFriendsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.id, for: indexPath) as? FriendCell else { fatalError() }
        let user = isSearched ? filterUsers[indexPath.row] : users[indexPath.row]
        let viewModel = FrinedCellViewData(user: user)
        cell.viewData = viewModel
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearched ? filterUsers.count : users.count
    }
}
extension SearchFriendsController: SearchFriendsViewable {
    func showError() {

    }
    func showResult(_ user: [User]) {

    }
}
