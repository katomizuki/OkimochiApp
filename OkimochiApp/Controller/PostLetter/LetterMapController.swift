import UIKit
import CoreLocation
import MapKit
class LetterMapController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var mapView: MKMapView!
    var searchController = UISearchController(searchResultsController: ResultMapController())
    @IBOutlet weak var postLetterButton: UIButton! {
        didSet {
            postLetterButton.layer.cornerRadius = 15
            postLetterButton.layer.masksToBounds = true
        }
    }
    // MARK: - Lifecycle
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
    // MARK: - IBAction
    @IBAction func didTapPostLetterButton(_ sender: Any) {
        print(#function)
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "FinishLetterController") as? FinishLetterController else { return }
        navigationController?.pushViewController(controller, animated: true)
    }
}
// MARK: - UISearchResultsUpdating
extension LetterMapController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print(#function)
        guard let query = searchController.searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
        let resultVC = searchController.searchResultsController as? ResultMapController else {
            return }
        if query.count <= 3 { return }
        resultVC.delegate = self
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
// MARK: - ResultMapControllerDelegate
extension LetterMapController: ResultMapControllerDelegate {
    func didTapPlace(coordinator: CLLocationCoordinate2D) {
        searchController.searchBar.resignFirstResponder()
        let annotions = mapView.annotations
        mapView.removeAnnotations(annotions)
        print(#function)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinator
        mapView.addAnnotation(pin)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinator, span: span)
        mapView.setRegion(region, animated: true)
    }
}
