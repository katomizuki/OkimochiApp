
import Foundation
import UIKit

class ResultMapController: UITableViewController {
    // MARK: - Properties
    private var places = [Place]()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    // MARK: - Helper
    public func update(with places: [Place]) {
        self.places = places
        tableView.reloadData()
    }
    
}
// MARK: - Delegate
extension ResultMapController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let place = places[indexPath.row]
        
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
