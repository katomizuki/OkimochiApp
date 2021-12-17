import Foundation
import UIKit
import CoreLocation
protocol ResultMapControllerDelegate:AnyObject {
    func didTapPlace(coordinator: CLLocationCoordinate2D)
}
final class ResultMapController: UITableViewController {
    // MARK: - Properties
    private var places = [Place]()
    weak var delegate: ResultMapControllerDelegate?
    static let id = String(describing: self)
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    // MARK: - Helper
    public func update(with places: [Place]) {
        print(#function,places)
        self.places = places
        self.tableView.isHidden = false
        tableView.reloadData()
    }
    
}
// MARK: - Delegate
extension ResultMapController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        tableView.isHidden = true
        let place = places[indexPath.row]
        GooglePlacesManager.shared.resolveLocation(place: place) { [weak self] result in
            switch result {
            case .success(let coordinator): self?.delegate?.didTapPlace(coordinator: coordinator)
            case .failure(let error): print(error)
            }
        }
    }
}
// MARK: - Datasource
extension ResultMapController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
        cell.textLabel?.text = places[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
}
