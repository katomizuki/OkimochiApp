import UIKit

class LetterMapController: UIViewController {
    var searchController = UISearchController(searchResultsController: ResultMapController())
    @IBOutlet weak var postLetterButton: UIButton! {
        didSet {
            postLetterButton.layer.cornerRadius = 15
            postLetterButton.layer.masksToBounds = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        setupSearchController()
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
    
    @IBAction func didTapPostLetterButton(_ sender: Any) {
        print(#function)
    }
}
// MARK: - UISearchResultsUpdating
extension LetterMapController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
        
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
        let resultVC = searchController.searchResultsUpdater as? ResultMapController else { return }
        GooglePlacesManager.shared.findPlaces(query: query) { results in
            switch results {
            case .success(let places):
                print(places)
                DispatchQueue.main.async {
                    resultVC.update(with: places)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
