import UIKit

class SearchFriendsController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
    }
    private func setupSearchController() {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = false
        if #available(iOS 11.0, *) {
            navigationItem.searchController = controller
            navigationItem.hidesSearchBarWhenScrolling = true
            
        }
    }
    


}
// MARK: - UISearchResultsUpdating
extension SearchFriendsController :UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
    }
}
