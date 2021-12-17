import UIKit

class SearchFriendsController: UIViewController,SearchFriendsViewable {
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var searchController = UISearchController(searchResultsController: nil)
    var isSearched: Bool {
        return searchController.searchBar.text?.isEmpty == false
    }
    private var users = [User]()
    private var filterUsers = [User]()
    private var selectedIndex = Int()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupTableView()
        setupUserData()
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
        let nib = FriendCell.nib()
        tableView.register(nib, forCellReuseIdentifier: FriendCell.id)
        tableView.rowHeight = 80
    }
    private func setupUserData() {
//        UserService.fetchUsers { users in
//            self.users = users
//            self.tableView.reloadData()
//        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriedDetailController" {
            let controller = segue.destination as! FriedDetailController
            let user = isSearched ? filterUsers[selectedIndex] : users[selectedIndex]
            controller.user = user
        }
    }
}
// MARK: - UISearchResultsUpdating
extension SearchFriendsController : UISearchResultsUpdating {
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
        performSegue(withIdentifier: "FriedDetailController", sender: nil)
    }
}
// MARK: - UITableViewDataSource
extension SearchFriendsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.id, for: indexPath) as? FriendCell else { fatalError() }
        let user = isSearched ? filterUsers[indexPath.row] : users[indexPath.row]
        let viewModel = FrinedCellViewData(user: user)
        cell.viewModel = viewModel
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearched ? filterUsers.count : users.count
    }
}
